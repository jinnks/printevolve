package PrintMove::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    INCLUDE_PATH => [
         PrintMove->path_to( 'root', 'src' ),
     ],
 
);

=head1 NAME

PrintMove::View::HTML - TT View for PrintMove

=head1 DESCRIPTION

TT View for PrintMove.

=head1 SEE ALSO

L<PrintMove>

=head1 AUTHOR

Farhan Siddiqui,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
