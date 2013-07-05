package Geo::JSON::Point;

our $VERSION = '0.001'; # VERSION

# ABSTRACT: object representing a geojson Point

use Moo;
extends 'Geo::JSON::Geometry';

use Carp;

use Geo::JSON::Types -types;

has '+coordinates' => ( isa => Position );

around compute_bbox => sub {
    croak "Can't compute_bbox with a single position";
};

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::Point - object representing a geojson Point

=head1 VERSION

version 0.001

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
