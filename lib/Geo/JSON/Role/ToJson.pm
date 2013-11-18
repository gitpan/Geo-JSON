package Geo::JSON::Role::ToJson;

our $VERSION = '0.005'; # VERSION

# ABSTRACT: Moo::Role providing to_json() methods for a geojson object

use Role::Tiny;


sub to_json {
    my $self = shift;
    my $codec = shift || $Geo::JSON::json;
    return $codec->encode($self);
}

# used by JSON 'convert_blessed'
sub TO_JSON {
    return { type => $_[0]->type, %{ $_[0] } };
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::Role::ToJson - Moo::Role providing to_json() methods for a geojson object

=head1 VERSION

version 0.005

=head1 DESCRIPTION

Provides the C<to_json> method.

=head1 METHODS

=head2 to_json

    $point->to_json();

    # or with custom JSON codec
    $point->to_json( $codec );

Returns JSON string representing this object.

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
