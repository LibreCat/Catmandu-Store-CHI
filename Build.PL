
# This file was automatically generated by Dist::Zilla::Plugin::ModuleBuild v6.008.
use strict;
use warnings;

use Module::Build 0.28;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.28"
  },
  "configure_requires" => {
    "Module::Build" => "0.28"
  },
  "dist_abstract" => "a CHI backed caching store",
  "dist_author" => [
    "Patrick Hochstenbach, C<< <patrick.hochstenbach at ugent.be> >>"
  ],
  "dist_name" => "Catmandu-Store-CHI",
  "dist_version" => "0.04",
  "license" => "perl",
  "module_name" => "Catmandu::Store::CHI",
  "recursive_test_files" => 1,
  "requires" => {
    "CHI" => "0.58",
    "Catmandu" => "1.2001",
    "Moo" => "1.0",
    "perl" => "v5.10.1"
  },
  "test_requires" => {
    "Test::Exception" => 0,
    "Test::More" => "1.001003",
    "Test::Simple" => "1.001003"
  }
);


my %fallback_build_requires = (
  "Module::Build" => "0.28",
  "Test::Exception" => 0,
  "Test::More" => "1.001003",
  "Test::Simple" => "1.001003"
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build->new(%module_build_args);


$build->create_build_script;
