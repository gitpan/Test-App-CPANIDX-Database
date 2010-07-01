
use strict;
use warnings;

BEGIN { require v5.8.0; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'generate a test database for App::CPANIDX',
  'AUTHOR' => 'Chris Williams <chris@bingosnet.co.uk>',
  'BUILD_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.42',
    'File::Temp' => '0.22',
    'Test::More' => '0.47'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.42'
  },
  'DISTNAME' => 'Test-App-CPANIDX-Database',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Test::App::CPANIDX::Database',
  'PREREQ_PM' => {
    'App::CPANIDX::Tables' => '0.18',
    'DBD::SQLite' => '1.29',
    'DBI' => '1.609'
  },
  'VERSION' => '0.04',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



