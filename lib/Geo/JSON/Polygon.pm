package Geo::JSON::Polygon;

our $VERSION = '0.005'; # VERSION

# ABSTRACT: object representing a geojson Polygon

use Moo;
extends 'Geo::JSON::Base';
with 'Geo::JSON::Role::Geometry';

use Geo::JSON::Types -types;

has '+coordinates' => ( isa => Polygon );

sub all_positions {
    my $self = shift;

    return [ map { @{$_} } @{ $self->coordinates } ];
}


1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::Polygon - object representing a geojson Polygon

=head1 VERSION

version 0.005

=head1 SYNOPSIS

    use Geo::JSON::Polygon;
    my $pg = Geo::JSON::Polygon->new({
        coordinates => [ [ 51.50101, -0.14159 ], ... ],
                       [ [ 54.0, 0 ], ... ],
    });
    my $json = $pg->to_json;

=head1 DESCRIPTION

A GeoJSON object with a coordinates attribute of an arrayref of arrayrefs of
positions. This represents a multiple LinearRing coordinate arrays, the first
defining the exterior ring or the polygon, and the others any interior ring(s)
or holes.

See L<Geo::JSON> for more details.

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
