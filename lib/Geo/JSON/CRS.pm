package Geo::JSON::CRS;

our $VERSION = '0.006'; # VERSION

# ABSTRACT: Co-ordinate Reference System object

use Moo;
with 'Geo::JSON::Role::ToJson';

use Types::Standard qw/ HashRef /;

use Geo::JSON;

has type => (
    is       => 'ro',
    required => 1,
    isa      => sub {
        die "CRS type must be either 'name' or 'link'"
            unless $_[0] && ( $_[0] eq 'name' || $_[0] eq 'link' );
    },
);

has properties => ( is => 'ro', isa => HashRef, required => 1 );


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Geo::JSON::CRS - Co-ordinate Reference System object

=head1 VERSION

version 0.006

=head1 SYNOPSIS

    use Geo::JSON::CRS;
    
    # A named CRS
    my $wgs84 = Geo::JSON::CRS->new(
        {   type       => 'name',
            properties => { name => 'urn:ogc:def:crs:OGC:1.3:CRS84' }
        }
    );
    # older formats are also possible, e.g. "urn:ogc:def:crs:EPSG::4326"
    
    # A linked CRS
    my $crs = Geo::JSON::CRS->new(
        {   type       => 'link',
            properties => {
                href => 'http://example.com/crs/42',
                type => 'proj4'
            }
        }
    );
    
    # A relative link
    my $crs = Geo::JSON::CRS->new(
        {   type       => 'link',
            properties => {
                href => 'data.crs',
                type => 'ogcwkt'
            }
        }
    );

=head1 DESCRIPTION

Perl class to represent a Coordinate Reference System object. The default
GeoJSON CRS "is a geographic coordinate reference system, using the WGS84
datum, and with longitude and latitude units of decimal degrees."

Set a CRS value on a GeoJSON object to change this.

See L<Geo::JSON> for more details.

=head1 ATTRIBUTES

=head2 type

Either 'name' or 'link'

=head2 properties

Hashref.

For objects of type 'name', a 'name' key is required, the value being a
string identifying the CRS.

For objects of type 'link', 'href' and 'type' keys are required. Link types
are not restricted, examples include "proj4", "ogcwkt", "esriwkt",

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
