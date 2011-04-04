# $Id: Makefile.PL 3102 2011-04-04 19:35:18Z khera $
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME => 'PayflowPro',
    PREREQ_PM => {
	'LWP' => 0,
    },
    VERSION_FROM => 'PayflowPro.pm',
    AUTHOR => 'Vivek Khera <vivek@khera.org>',
    ABSTRACT => 'Pure Perl PayflowPro payment gateway interface',
    LICENSE => 'perl',
);

sub MY::postamble {
  return <<'MAKE_FRAG';
all :: README ca-bundle.crt

README: PayflowPro.pm
	pod2text PayflowPro.pm > README

ca-bundle.crt: mkcabundle
	perl mkcabundle > ca-bundle.crt
MAKE_FRAG
}
