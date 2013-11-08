package Geo::JSON::MultiLineString;

our $VERSION = '0.003'; # VERSION

# ABSTRACT: object representing a geojson MultiLineString

use Moo;
extends 'Geo::JSON::Geometry';

use Geo::JSON::Types -types;

has '+coordinates' => ( isa => LineStrings );

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

Geo::JSON::MultiLineString - object representing a geojson MultiLineString

=head1 VERSION

version 0.003

=head1 SYNOPSIS

    use Geo::JSON::MultiLineString;
    my $mls = Geo::JSON::MultiLineString->new({
        coordinates => [ [ 51.50101, -0.14159 ], ... ],
                       [ [ 54.0, 0 ], ... ],
    });
    my $json = $mls->to_json;

=head1 DESCRIPTION

A GeoJSON object with a coordinates attribute of an arrayref of
arrayrefs of positions.

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
