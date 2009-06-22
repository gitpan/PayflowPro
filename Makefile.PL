# $Id: Makefile.PL 1580 2008-08-12 16:38:25Z khera $
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME => 'PayflowPro',
    PREREQ_PM => {
	'LWP' => 0,
    },
    dist => {
	PREOP => 'pod2text PayflowPro.pm > README; perl mkcabundle > ca-bundle.crt',
    },
    VERSION_FROM => 'PayflowPro.pm',
    );
