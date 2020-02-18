#!/usr/local/bin/perl
use strict;
use warnings;
use Term::ReadKey;
my $key;

print "Do you want me to write the output to a file? (y/n) ";
my $file = <STDIN>;
chomp $file;
if ($file ne "y") || ($file eq "n") {
    print "Give only y or n\n";
    exit(0);
};

print "Checking addresses. Be patient\n";
my $v4 = `curl -s 'https://v4.ident.me/'`;
my $v6 = `curl -s 'https://v6.ident.me/'`;
if ($file eq "y") {
    print "Where to store the output? (Default: ./ident.txt) ";
    my $outputfile = <STDIN>;
    chomp $outputfile;
    ($outputfile = "./ident.txt") if ($outputfile eq "");
    open my $OUT, '>', $outputfile or die "Can't open file: $!\nDo you have write access to the file?";
    print $OUT "Your external IPv4 is $v4\n";
    print $OUT "Your external IPv6 is $v6\n\n";
    print $OUT "PTR-Record for $v4 is:\n",`nslookup $v4`,"\n";
    print $OUT "PTR-Record for $v6 is:\n",`nslookup $v6`,"\n";
    print $OUT "whois of $v4:\n",`whois $v4`,"\n";
    print $OUT "whois of $v6:\n",`whois $v6`,"\n";
    close $OUT;
    print "Done. See ",$outputfile," for the result.\n"
} elsif ($file eq "n") {
    print "Your external IPv4 is $v4\n";
    print "Your external IPv6 is $v6\n\n";
    print "Press 'q' to exit or any other key for PTR-Records\n";
    ReadMode('cbreak');
    $key = ReadKey(0);
    ReadMode('normal');
    (exit (0)) if ($key eq "q");
    print "PTR-Record for $v4 is:\n",`nslookup $v4`,"\n";
    print "PTR-Record for $v6 is:\n",`nslookup $v6`,"\n";
    print "Press 'q' to exit or any other key for 'whois $v4'\n";
    ReadMode('cbreak');
    $key = ReadKey(0);
    ReadMode('normal');
    (exit (0)) if ($key eq "q");
    print "whois of $v4:\n",`whois $v4`,"\n";
    print "Press 'q' to exit or any other key for 'whois $v6'\n";
    ReadMode('cbreak');
    $key = ReadKey(0);
    ReadMode('normal');
    (exit (0)) if ($key eq "q");
    print "whois of $v6:\n",`whois $v6`,"\n";
};
