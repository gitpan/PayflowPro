#!/usr/local/bin/perl
use strict;

# This is an internal test script; it is not an example of how to use the
# module.  Please see the README file or the perldoc for instructions.

use PayflowPro qw(pfpro pftestmode pfdebug);

pftestmode(1);
pfdebug(1);

unless (defined $ENV{PFUSER} and defined $ENV{PFVENDOR} and
	defined $ENV{PFPARTNER} and defined $ENV{PFPWD}) {
  warn "\nSet PFUSER PFVENDOR PFPARTNER and PFPWD environment variables to\n";
  warn "run the tests.  Optionally set HTTPS_CA_FILE too as per docs.\n\n";
  exit(0);
}

my $data = {
  USER=>$ENV{PFUSER},
  VENDOR=>$ENV{PFVENDOR},
  PARTNER=>$ENV{PFPARTNER},
  PWD=>$ENV{PFPWD},

  AMT=> '32.23',
  TAXAMT=>'0.00',      # no tax charged, but specifying it lowers cost
#  TAXEXEMPT=>'Y',
  INVNUM=>$$,
  DESC=>"Test invoice $$",
  COMMENT1=>"Comment 1 $$",
  COMMENT2=>"Comment 2 $$",
  CUSTCODE=>$$ . 'a' . $$,

  TRXTYPE=>'S',			# sale
  TENDER=>'C',			# credit card

  # Commercial Card additional info
  PONUM=>$$.'-'.$$,
  SHIPTOZIP=>'20878', # for AmEx Level 2
  DESC4=>'FRT0.00',	# for AmEx Level 2

  # verisign tracking info
  STREET => '123 Any`Street',
  CITY => 'Anytown',
  COUNTRY => 'us',
  FIRSTNAME => 'Firsty',
  LASTNAME => 'Lasty',
  STATE => 'md',
  ZIP => '20878',

  ACCT => '5555555555554444',
  EXPDATE => '1221',
  CVV2 => '123',
};

my $res = pfpro($data);


print "pfpro answer:\n";
while (my ($k,$v) = each %{$res}) {
  print " $k => $v\n";
}
exit(0);
