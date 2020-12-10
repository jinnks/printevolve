use utf8;
package PrintMove::Schema::Result::Request;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PrintMove::Schema::Result::Request

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<request>

=cut

__PACKAGE__->table("request");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 request_type

  data_type: 'text'
  is_nullable: 1

=head2 request_message

  data_type: 'text'
  is_nullable: 1

=head2 request_from

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "request_type",
  { data_type => "text", is_nullable => 1 },
  "request_message",
  { data_type => "text", is_nullable => 1 },
  "request_from",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 client_requests

Type: has_many

Related object: L<PrintMove::Schema::Result::ClientRequest>

=cut

__PACKAGE__->has_many(
  "client_requests",
  "PrintMove::Schema::Result::ClientRequest",
  { "foreign.request_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 clients

Type: many_to_many

Composing rels: L</client_requests> -> client

=cut

__PACKAGE__->many_to_many("clients", "client_requests", "client");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-12-10 15:51:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3nwja7kBK9tGeKIcO4i6Lg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
