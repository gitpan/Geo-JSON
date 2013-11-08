package Geo::JSON::MultiPoint;

our $VERSION = '0.003'; # VERSION

# ABSTRACT: object representing a geojson MultiPoint

use Moo;
extends 'Geo::JSON::Geometry';

use Geo::JSON::Types -types;

has '+coordinates' => ( isa => Positions );

sub all_positions {
    my $self = shift;

    return [ map { @{$_} } @{ $self->coordinates } ];
}


1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::MultiPoint - object representing a geojson MultiPoint

=head1 VERSION

version 0.003

=head1 SYNOPSIS

    use Geo::JSON::MultiPoint;
    my $mpt = Geo::JSON::Point->new({
        coordinates => [ [ 51.50101, -0.14159 ],
                         [ 57.596278, -13.687306 ],
                       ],
    });
    my $json = $mpt->to_json;

=head1 DESCRIPTION

A GeoJSON object with a coordinates attribute consisting of an arrayref of
positions.

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
