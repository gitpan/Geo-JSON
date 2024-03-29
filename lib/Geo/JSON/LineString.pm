package Geo::JSON::LineString;

our $VERSION = '0.006'; # VERSION

# ABSTRACT: object representing a geojson LineString

use Moo;
extends 'Geo::JSON::Base';
with 'Geo::JSON::Role::Geometry';

use Geo::JSON::Types -types;

has '+coordinates' => ( isa => LineString );


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Geo::JSON::LineString - object representing a geojson LineString

=head1 VERSION

version 0.006

=head1 SYNOPSIS

    use Geo::JSON::LineString;
    my $ls = Geo::JSON::LineString->new({
        coordinates => [ [ 51.50101, -0.14159 ], ... ],
    });
    my $json = $ls->to_json;

=head1 DESCRIPTION

A GeoJSON object with a coordinates attribute of an arrayref of
positions.

See L<Geo::JSON> for more details.

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
