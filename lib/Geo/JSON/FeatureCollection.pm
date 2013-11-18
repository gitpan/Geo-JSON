package Geo::JSON::FeatureCollection;

our $VERSION = '0.005'; # VERSION

# ABSTRACT: object representing a geojson FeatureCollection

use Moo;
extends 'Geo::JSON::Base';

use Carp;
use Types::Standard qw/ ArrayRef HashRef /;

use Geo::JSON::Types -types;
use Geo::JSON::Utils;

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

version 0.005

=head1 SYNOPSIS

    use Geo::JSON::FeatureCollection;
    
    # @feature_objects can be an array of Geo::JSON::Feature objects or
    # hashrefs that define Geo::JSON::Feature objects.
    my $fcol = Geo::JSON::FeatureCollection->new({
         features => \@feature_objects,
    });
    
    my $json = $fcol->to_json;

=head1 DESCRIPTION

A GeoJSON object with a features attribute of an arrayref of
L<Geo::JSON::Feature> objects.

See L<Geo::JSON> for more details.

=head1 SEE ALSO

=over

=item *

L<Geo::JSON::Feature>

=back

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
