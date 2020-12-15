#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::JSON;
use lib './lib';
use PrintMove;
use DDP;

use Catalyst::Test 'PrintMove';

ok( request('/')->is_success, 'Request should succeed' );
my $pm = PrintMove->new();
my $data = {'foo'=>{'bar'=>['baz', 'bax']}};
my $expected_json = '{"foo":{"bar":["baz","bax"]}}';
my $json_data = $pm->to_json($data);
is_valid_json($json_data, 'JSON is well formed');
is_json($json_data, $expected_json, 'JSON is correct');
done_testing();
