package Geo::JSON::Feature;

our $VERSION = '0.006'; # VERSION

# ABSTRACT: object representing a geojson Feature

use Moo;
extends 'Geo::JSON::Base';

use Carp;
use Type::Utils qw( class_type );
use Types::Standard qw/ Str Maybe HashRef /;

use Geo::JSON::Types -types;
use Geo::JSON::Utils;

has id => ( is => 'ro', isa => Maybe [Str] );

has geometry => (
    is       => 'ro',
    isa      => Geometry,
    coerce   => Geometry->coercion,
    required => 1
);

has properties => ( is => 'ro', isa => Maybe [HashRef] );

sub all_positions {
    return shift->geometry->all_positions;
}


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Geo::JSON::Feature - object representing a geojson Feature

=head1 VERSION

version 0.006

=head1 SYNOPSIS

    use Geo::JSON::Feature;
    my $ft = Geo::JSON::Feature->new({
        geometry   => $geometry_object,
        properties => \%properties,
    });
    my $json = $ft->to_json;

=head1 DESCRIPTION

A GeoJSON object with a geometry attribute of a single Geometry object and
an optional properties attribute.

A geometry object is one of the following:

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

=back

See L<Geo::JSON> for more details.

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
