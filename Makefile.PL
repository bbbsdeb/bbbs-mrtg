use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'BBBS::MRTG',
    AUTHOR              => q{Robert James Clay <jame@rocasa.us>},
    VERSION_FROM        => 'lib/BBBS/MRTG.pm',
    ABSTRACT_FROM       => 'lib/BBBS/MRTG.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'bbbs-mrtg*' },
);
