package Geo::JSON::Geometry;

our $VERSION = '0.004'; # VERSION

# ABSTRACT: object representing a geojson Geometry

use Moo;
extends 'Geo::JSON::Base';

use Types::Standard qw/ Any /;

use Geo::JSON::Utils;

has coordinates => ( is => 'ro', isa => Any, required => 1 );

sub compute_bbox {
    return Geo::JSON::Utils::compute_bbox( shift->all_positions );
}

sub all_positions {
    my $self = shift;
    return $self->coordinates;
}


1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::Geometry - object representing a geojson Geometry

=head1 VERSION

version 0.004

=head1 DESCRIPTION

Base class for GeoJSON geometry objects (Point, MultiPoint, LineString,
MultiLineString, Polygon, MultiPolygon).

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
