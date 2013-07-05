package Geo::JSON;

our $VERSION = '0.001'; # VERSION

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

our $json = JSON->new->canonical(1)->pretty->utf8->convert_blessed(1);


sub from_json {
    my ( $class, $json ) = @_;

    my $data = decode_json($json);

    croak "from_json requires a JSON object (hashref)"
        unless ref $data eq 'HASH';

    my $type = delete $data->{type}
        or croak "Invalid JSON data: no type specified";

    my $geo_json_class = 'Geo::JSON::' . $type;

    eval "require $geo_json_class";
    croak "Unable to load '$geo_json_class'; $@" if $@;

    return $geo_json_class->new($data);
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON - Perl OO interface for geojson 

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use Geo::JSON;
    
    my $obj = Geo::JSON->from_json( $json );

=head1 DESCRIPTION

Convert to and from geojson using Perl objects. See the individual object
classes for more details.

Currently in development - feedback welcome.

Currently supports 2 or 3 dimensions (longitude, latitude, altitude). If there
is a case for increasing this to support a higher or arbitrary number please
let me know.

=head1 GEOJSON SPECIFICATION

See: L<http://www.geojson.org/geojson-spec.html>

=head1 OBJECTS

=over

=item *

L<Geo::JSON::Point>

=item *

L<Geo::JSON::MultiPoint>

=item *

L<Geo::JSON::LineString>

=item *

L<Geo::JSON::MultiLineString>

=item *

L<Geo::JSON::Polygon>

=item *

L<Geo::JSON::MultiPolygon>

=item *

L<Geo::JSON::GeometryCollection>

=item *

L<Geo::JSON::Feature>

=item *

L<Geo::JSON::FeatureCollection>

=back

=head1 METHODS

=head2 from_json

    my $obj = Geo::JSON->from_json( $json );

Takes a geojson string, returns the object it represents.

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
