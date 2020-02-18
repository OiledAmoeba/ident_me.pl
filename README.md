# ident_me.pl
Showing your public IPv4 and IPv6 addresses and give you informations from nslookup and whois

## REQUIREMENTS
* perl  (testet with perl 5.26)
* whois
* nslookup
* perl-module Term::ReadKey (install it with `cpan install Term::ReadKey` or `cpanm -i Term::ReadKey`(if cpanm is installed))

## Usage
1. Clone the project or download ident_me.pl
1. Alter the shebang (line 1) in ident_me.pl to fit to your installation. For FreeBSD `#!/usr/local/bin/perl` should be good. If you don't know where your perl is installed you can find it with `find / -name 'perl'`
1. make ident_me.pl executable with `chmod u+x ident_me.pl`
1. run `./ident_me.pl`
    1. decide to get the output to `<STDOUT>` (answer: n) or to a file (answer: y)
    1. if you choose to use a file, answer where you want to save it or use the default (./ident.txt)