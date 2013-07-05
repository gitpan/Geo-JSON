package Geo::JSON::FeatureCollection;

our $VERSION = '0.001'; # VERSION

# ABSTRACT: object representing a geojson FeatureCollection

use Moo;
extends 'Geo::JSON::Base';

use Carp;
use Types::Standard qw/ ArrayRef HashRef /;

use Geo::JSON::Types -types;

has features => (
    is       => 'ro',
    isa      => Features,
    coerce   => Features->coercion,
    required => 1
);

sub all_positions {
    my $self = shift;
    return [ map { @{ $_->all_positions } } @{ $self->features } ];
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::FeatureCollection - object representing a geojson FeatureCollection

=head1 VERSION

version 0.001

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
