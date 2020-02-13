# ident_me.pl
Showing your public IPv4 and IPv6 addresses and give you informations from nslookup and whois

## REQUIREMENTS
* perl  (testet with perl 5.26)
* whois
* nslookup
* perl-module Term::ReadKey (install it with `cpan install Term::ReadKey` or `cpanm -i Term::ReadKey`(if cpanm is installed))

## Usage
1. Clone the project or download ident_me.pl
2. Alter the shebang (line 1) in ident_me.pl to fit to your installation. For FreeBSD `#!/usr/local/bin/perl` should be good. If you don't know where your perl is installed you can find it with `find / -name 'perl'`
2. make ident_me.pl executable with `chmod u+x ident_me.pl
3. run `./ident_me.pl`
