#!/usr/local/bin/perl
use strict;
use warnings;
use Term::ReadKey;

print "Do you want me to write the output to a file?\n";
ReadMode 4; # change to raw input mode
my $key = '';
while($key !~ /(Y|N)/i) {
    1 while defined ReadKey -1; # discard any previous input
    print "Type Y/N: ";
    $key = ReadKey 0; # read a single character
    print "$key\n";
}
ReadMode 0; # reset the terminal to normal mode

my $file = $key;
print "Checking addresses. Be patient\n";
my $v4 = `curl -s 'https://v4.ident.me/'`;
my $v6 = `curl -s 'https://v6.ident.me/'`;
if ($file eq "y") {
    print "Where to store the output? (Default: ./ident.txt) ";
    my $outputfile = <STDIN>;
    chomp $outputfile;
    ($outputfile = "./ident.txt") if ($outputfile eq "");
    open my $OUT, '>', $outputfile or die "Can't open file: $!\nDo you have write access to the file?";
    print $OUT "Your external IPv4 is $v4\n","Your external IPv6 is $v6\n\n","PTR-Record for $v4 is:\n",`nslookup $v4`,"\n","PTR-Record for $v6 is:\n",`nslookup $v6`,"\n","whois of $v4:\n",`whois $v4`,"\n","whois of $v6:\n",`whois $v6`,"\n";
    close $OUT;
    print "Done. See ",$outputfile," for the result.\n"
} elsif ($file eq "n") {
    print "Your external IPv4 is $v4\n","Your external IPv6 is $v6\n\n","Press 'q' to exit or any other key for PTR-Records\n";
    ReadMode('cbreak');
    $key = ReadKey(0);
    ReadMode('normal');
    (exit (0)) if ($key eq "q");
    print "PTR-Record for $v4 is:\n",`nslookup $v4`,"\n","PTR-Record for $v6 is:\n",`nslookup $v6`,"\n","Press 'q' to exit or any other key for 'whois $v4'\n";
    ReadMode('cbreak');
    $key = ReadKey(0);
    ReadMode('normal');
    (exit (0)) if ($key eq "q");
    print "whois of $v4:\n",`whois $v4`,"\n","Press 'q' to exit or any other key for 'whois $v6'\n";
    ReadMode('cbreak');
    $key = ReadKey(0);
    ReadMode('normal');
    (exit (0)) if ($key eq "q");
    print "whois of $v6:\n",`whois $v6`,"\n";
};
