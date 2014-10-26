use strict;
use warnings;
use Data::Page;
use Test::More tests => 2;

my @data = map { { $_ => ord($_), z => ord($_)+1 } } 'a' .. 'c';
#diag explain \@data;

my $page = Data::Page->new;
$page->total_entries(scalar @data);
$page->entries_per_page(2);


$page->current_page(1);
is_deeply [$page->splice(\@data)], [
	{
	     'a' => 97,
	     'z' => 98
	},
	{
	    'b' => 98,
	    'z' => 99
	},
];

$page->current_page(2);
is_deeply [$page->splice(\@data)], [
	{
	    'c' => 99,
	    'z' => 100
	}
];
