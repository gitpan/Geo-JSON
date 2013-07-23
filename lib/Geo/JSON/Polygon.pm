package Geo::JSON::Polygon;

our $VERSION = '0.002'; # VERSION

# ABSTRACT: object representing a geojson Polygon

use Moo;
extends 'Geo::JSON::Geometry';

use Geo::JSON::Types -types;

has '+coordinates' => ( isa => Polygon );

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

Geo::JSON::Polygon - object representing a geojson Polygon

=head1 VERSION

version 0.002

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
