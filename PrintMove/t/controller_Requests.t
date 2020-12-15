use strict;
use warnings;
use Test::More;
use Test::MockObject;
use DDP;

use lib "./lib";
use Catalyst::Test 'PrintMove';
use Test::WWW::Mechanize::Catalyst;
my $ua = Test::WWW::Mechanize::Catalyst->new(catalyst_app => 'PrintMove');
$ua->get_ok('/requests', "ALL OK");
is($ua->ct('text/html'), "text/html");
$ua->title_is('Contact form');

done_testing();
