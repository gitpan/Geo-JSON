
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.17;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Perl OO interface for geojson",
  "AUTHOR" => "Michael Jemmeson <mjemmeson\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Geo-JSON",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Geo::JSON",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => 0,
    "JSON" => 0,
    "List::Util" => 0,
    "Moo" => 0,
    "Moo::Role" => 0,
    "Type::Library" => 0,
    "Type::Utils" => 0,
    "Types::Standard" => 0,
    "base" => 0,
    "constant" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Class::Load" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Spec::Functions" => 0,
    "Path::Class" => 0,
    "Test::Fatal" => 0,
    "Test::More" => 0,
    "Test::Most" => 0,
    "lib" => 0
  },
  "VERSION" => "0.006",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Class::Load" => 0,
  "Exporter" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Spec::Functions" => 0,
  "JSON" => 0,
  "List::Util" => 0,
  "Moo" => 0,
  "Moo::Role" => 0,
  "Path::Class" => 0,
  "Test::Fatal" => 0,
  "Test::More" => 0,
  "Test::Most" => 0,
  "Type::Library" => 0,
  "Type::Utils" => 0,
  "Types::Standard" => 0,
  "base" => 0,
  "constant" => 0,
  "lib" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



