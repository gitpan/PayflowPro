# $Id: Makefile.PL 1150 2007-08-03 21:16:19Z khera $
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
