#!/usr/local/bin/perl
use strict;
use warnings;
use Term::ReadKey;
my $key;

print "Checking addresses. Be patient\n";
my $v4 = `curl -s 'https://v4.ident.me/'`;
my $v6 = `curl -s 'https://v6.ident.me/'`;

print "Your external IPv4 is $v4\n";
print "Your external IPv6 is $v6\n\n";
print "Press any key for PTR-Records\n";
ReadMode('cbreak');
$key = ReadKey(0);
ReadMode('normal');
print "PTR-Record for $v4 is:\n",`nslookup $v4`,"\n";
print "PTR-Record for $v6 is:\n",`nslookup $v6`,"\n";
print "Press any key for 'whois $v4'\n";
ReadMode('cbreak');
$key = ReadKey(0);
ReadMode('normal');
print "whois of $v4:\n",`whois $v4`,"\n";
print "Press any key for 'whois $v6'\n";
ReadMode('cbreak');
$key = ReadKey(0);
ReadMode('normal');
print "whois of $v6:\n",`whois $v6`,"\n";
