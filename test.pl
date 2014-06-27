#!/usr/bin/env perl

use lib qw(lib);
use Catmandu;
use Data::Dumper;

my $store = Catmandu->store('CHI');

$store->add({test => 123});
$store->add({test => 645});

$store->each(sub {
	my $obj = shift;
	print Dumper($obj);
});