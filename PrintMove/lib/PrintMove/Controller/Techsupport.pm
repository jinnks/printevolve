package PrintMove::Controller::Techsupport;
use Moose;
use namespace::autoclean;
use DDP;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

PrintMove::Controller::Techsupport - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash(clients => [$c->model('DB::Client')->all]);
    my $params = $c->request->params;
    p($params);
    my $client = $params->{clients};
    my $subject = $params->{subject};
    my $form_type = $params->{form_type}?'ammendment':'tech_support';
    my $file;
    if (keys %{$params}){
         my $request = $c->model('DB::Request')->create({
             request_type => $form_type,
             request_message => $params->{message},
             request_from => $params->{email}
         });
         $request->create_related('client_requests',{client_id => $client});
    }
}



=encoding utf8

=head1 AUTHOR

Farhan Siddiqui,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
