use strict;
use warnings;
use Test::More;


use Catalyst::Test 'PrintMove';
use PrintMove::Controller::Requests;

ok( request('/requests')->is_success, 'Request should succeed' );
done_testing();
