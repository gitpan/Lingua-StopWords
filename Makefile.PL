use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Lingua::StopWords',
    VERSION_FROM      => 'lib/Lingua/StopWords.pm',
    PREREQ_PM         => {},
    ($] >= 5.005 ?
      (ABSTRACT_FROM  => 'lib/Lingua/StopWords.pm',
       AUTHOR         => 'Fabien POTENCIER <fabpot@cpan.org>') : ()),
);
