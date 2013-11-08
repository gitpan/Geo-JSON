package Geo::JSON;

our $VERSION = '0.004'; # VERSION

# ABSTRACT: Perl OO interface for geojson

use strict;
use warnings;
use Carp;

use JSON qw/ decode_json /;

use Geo::JSON::CRS;
use Geo::JSON::FeatureCollection;
use Geo::JSON::Feature;
use Geo::JSON::GeometryCollection;
use Geo::JSON::Geometry;
use Geo::JSON::LineString;
use Geo::JSON::MultiLineString;
use Geo::JSON::MultiPoint;
use Geo::JSON::MultiPolygon;
use Geo::JSON::Point;
use Geo::JSON::Polygon;

our $json = JSON->new->utf8->convert_blessed(1);


sub from_json {
    my ( $class, $json ) = @_;

    my $data = decode_json($json);

    croak "from_json requires a JSON object (hashref)"
        unless ref $data eq 'HASH';

    my $type = delete $data->{type}
        or croak "Invalid JSON data: no type specified";

    my $geo_json_class = 'Geo::JSON::' . $type;

    return $geo_json_class->new($data);
}


sub codec {
    my $class = shift;

    my $orig = $json;
    $json = shift if @_;

    return $orig;
}


1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON - Perl OO interface for geojson

=head1 VERSION

version 0.004

=head1 SYNOPSIS

    use Geo::JSON;
    
    my $obj = Geo::JSON->from_json( $json );

=head1 DESCRIPTION

Convert to and from geojson using Perl objects. GeoJSON objects represent
various geographical positions - points, lines, polygons, etc.

Currently in development - feedback welcome.

Currently supports 2 or 3 dimensions (longitude, latitude, altitude). Further
dimensions in positions are ignored for calculations and comparisons, but will
be read-from and written-to.

=head1 GEOJSON SPECIFICATION

See: L<http://www.geojson.org/geojson-spec.html>

=head1 GEOJSON MEMBERS (ATTRIBUTES)

See the specification for the full details, but the basics are as follows:

=over

=item * C<type>

Determines the object the json will be turned into

=item * C<position>

Not explicitly named in the json, but an array of at least two numbers
representing a location in x, y, z order. (Either Easting, Northing, Altitude
or Longitude, Latitude, Altitude as appropriate).

Additional numbers may be present but ignored by this package for
calculations.

=item * C<coordinates>

Defined in geometry objects (Point, MultiPoint, LineString, MultiLineString,
Polygon, MultiPolygon). Will consist of a single position (Point), an array
of positions (MultiPoint, LineString), an array of arrays of positions
(MultiLineString, Polygon) or an array of arrays of arrays of positions
(MultiPolygon). The positions within a single object should all have the same
number of axes and be in the same axis order.

=item * C<bbox>

Optional, defining a bounding box that the position(s) are contained by.
FIXME define bbox

=item * C<crs>

Optional, defining the Co-ordinates Reference System the object is using. See
L<Geo::JSON::CRS> for more details.

=back

=head1 OBJECTS

=over

=item * L<Geo::JSON::Point>

A single position

=item * L<Geo::JSON::MultiPoint>

An array of positions, representing multiple points

=item * L<Geo::JSON::LineString>

An array of 2 or more positions, represening a connected line

=item * L<Geo::JSON::MultiLineString>

An array of lines

=item * L<Geo::JSON::Polygon>

An array of lines, defining a polygon. The first line represents the outside
of the polygon, subsequent lines define any 'holes'. The lines must be
'linear rings' - 4 or more points, with the first and last points being
equivalent.

=item * L<Geo::JSON::MultiPolygon>

An array of polygons

=item * L<Geo::JSON::GeometryCollection>

An array of any of the above Geometry objects (as attribute C<geometries>)

=item * L<Geo::JSON::Feature>

Any of the above objects (as attribute C<feature>), together with a data
structure (as attruibute C<properties>)

=item * L<Geo::JSON::FeatureCollection>

An array of Feature objects (as attribute C<features>)

=back

=head1 METHODS

=head2 from_json

    my $obj = Geo::JSON->from_json( $json );

Takes a geojson string, returns the object it represents.

=head1 CLASS METHODS

=head2 codec

    Geo::JSON->codec->canonical(1)->pretty;
    
    my $prev_codec = Geo::JSON->codec($new_codec);

Set options on or replace L<JSON> codec.

=head1 THANKS

Tim Bunce - for codec suggestions and bug spotting.

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders metacpan

=head1 SUPPORT

=head2 Bugs / Feature Requests

Please report any bugs or feature requests through the issue tracker
at L<https://github.com/mjemmeson/geo-json/issues>.
You will be notified automatically of any progress on your issue.

=head2 Source Code

This is open source software.  The code repository is available for
public review and contribution under the terms of the license.

L<https://github.com/mjemmeson/geo-json>

  git clone git://github.com/mjemmeson/geo-json.git

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
