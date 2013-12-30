package Geo::JSON::Role::Geometry;

our $VERSION = '0.006'; # VERSION

# ABSTRACT: Moo::Role representing behaviour of a geojson Geometry object

use Moo::Role;

use Types::Standard qw/ Any /;

has coordinates => ( is => 'ro', isa => Any, required => 1 );


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Geo::JSON::Role::Geometry - Moo::Role representing behaviour of a geojson Geometry object

=head1 VERSION

version 0.006

=head1 DESCRIPTION

L<Moo::Role> for GeoJSON geometry objects (Point, MultiPoint, LineString,
MultiLineString, Polygon, MultiPolygon).

See L<Geo::JSON> for more details.

=head1 ATTRIBUTES

=head2 coordinates

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
