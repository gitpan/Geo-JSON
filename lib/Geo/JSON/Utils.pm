package Geo::JSON::Utils;

our $VERSION = '0.002'; # VERSION

# ABSTRACT: Util methods for Geo::JSON classes

use strict;
use warnings;
use Carp;

use base 'Exporter';

our @EXPORT_OK = qw/ compare_positions compute_bbox /;

# TODO make better - need to ensure floating points are the same 
sub compare_positions {
    my ( $pos1, $pos2 ) = @_;

    # Assume positions have same number of dimensions
    my $dimensions = defined $pos1->[2] ? 2 : 1;

    foreach my $dim ( 0 .. $dimensions ) {

        # TODO fix stringification problems...?
        return 0
            if ( defined $pos1->[$dim] && !defined $pos2->[$dim] )
            || ( !defined $pos1->[$dim] && defined $pos2->[$dim] )
            || ( $pos1->[$dim] != $pos2->[$dim] );
    }
    return 1;
}

sub compute_bbox {
    my $positions = shift;    # arrayref of positions

    croak "Need an array of at least 2 positions"
        unless ref $positions
        && ref $positions eq 'ARRAY'
        && @{$positions} > 1;

    # Assumes all have same number of dimensions

    my $dimensions = defined $positions->[0]->[2] ? 2 : 1;

    my @min = my @max = @{ $positions->[0] };

    foreach my $position ( @{$positions} ) {
        foreach my $d ( 0 .. $dimensions ) {
            $min[$d] = $position->[$d] if $position->[$d] < $min[$d];
            $max[$d] = $position->[$d] if $position->[$d] > $min[$d];
        }
    }

    return [ @min, @max ];
}


1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::Utils - Util methods for Geo::JSON classes

=head1 VERSION

version 0.002

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
