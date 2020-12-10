use strict;
use warnings;

use PrintMove;

my $app = PrintMove->apply_default_middlewares(PrintMove->psgi_app);
$app;

