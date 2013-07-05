package Geo::JSON::GeometryCollection;

our $VERSION = '0.001'; # VERSION

# ABSTRACT: object representing a geojson GeometryCollection

use Moo;
extends 'Geo::JSON::Base';

use Carp;
use Types::Standard qw/ ArrayRef /;
use Geo::JSON::Types -types;

has geometries =>
    ( is => 'ro', isa => ArrayRef [Geometry], required => 1 );

sub all_positions {
    my $self = shift;

    return [ map { @{ $_->all_positions } } @{ $self->geometries } ];
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::GeometryCollection - object representing a geojson GeometryCollection

=head1 VERSION

version 0.001

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
