package Geo::JSON::MultiPolygon;

our $VERSION = '0.005'; # VERSION

# ABSTRACT: object representing a geojson MultiPolygon

use Moo;
extends 'Geo::JSON::Base';
with 'Geo::JSON::Role::Geometry';

use Geo::JSON::Types -types;

has '+coordinates' => ( isa => Polygons );

sub all_positions {
    my $self = shift;

    return [
        map { @{$_} }
        map { @{$_} } @{ $self->coordinates }
    ];
}


1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::MultiPolygon - object representing a geojson MultiPolygon

=head1 VERSION

version 0.005

=head1 SYNOPSIS

    use Geo::JSON::MultiPolygon;
    my $mpol = Geo::JSON::MultiPolygon->new({
        coordinates => [
            [   [...],     # outer linear ring
                [...], ... # inner linear ring(s)
            ],
            [...],
            ],
        },
    });
    my $json = $mpol->to_json;

=head1 DESCRIPTION

A GeoJSON object with a coordinates of an arrayref of polygon coordinates.

See L<Geo::JSON> for more details.

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
