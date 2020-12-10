use strict;
use warnings;
use Test::More;


use Catalyst::Test 'PrintMove';
use PrintMove::Controller::Techsupport;

ok( request('/techsupport')->is_success, 'Request should succeed' );
done_testing();
