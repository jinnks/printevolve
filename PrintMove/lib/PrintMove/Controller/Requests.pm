package PrintMove::Controller::Requests;
use Moose;
use namespace::autoclean;
use DDP;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

PrintMove::Controller::Requests - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut


sub index :Path :Args(0) {
    my ($self, $c) = @_;
    $c->stash(clients => [$c->model('DB::Client')->all]);
    my $file_drop_location = $self->{uploaded_files_dir};
    my $email_jobs_dir = $self->{email_jobs_dir};
    my $params = $c->request->params;
    my $client = $params->{clients};
    my $subject = $params->{subject};
    my $form_type = $params->{form_type}?'ammendment':'tech_support';
    my $file;
    p($params);
    if (keys %{$params}){
        my $email_job = {
          "to" => 'foo@bar.com',
          "from" => $params->{email},
          "subject" => $params->{subject},
          "body" => $params->{message},
         };
         my $request = $c->model('DB::Request')->create({
             request_type => $form_type,
             request_message => $params->{message},
             request_from => $params->{email}
         });
         $request->create_related('client_requests',{client_id => $client});
        foreach my $field ($c->request->upload("myfile")){
              ($field->tempname);
              $field->copy_to($file_drop_location);
              push @{$email_job->{"attachements"}}, {"mime-type" => "text/plain", "file" => $field->tempname};
            }
      my $json_data = $c->to_json($email_job);
      my $destination = "$email_jobs_dir"."$client"."_"."$subject";
      $c->write_to_file($json_data, $destination);

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
