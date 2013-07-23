package Geo::JSON::Base;

our $VERSION = '0.002'; # VERSION

# ABSTRACT: Base class for Geo::JSON objects

use Moo;

use Carp;
use Types::Standard qw/ Maybe ArrayRef Num /;

use Geo::JSON::Types -types;

has crs => ( is => 'ro', isa => Maybe [CRS], coerce => CRS->coercion );

has bbox => ( is => 'rw', isa => Maybe [ ArrayRef [Num] ] );

sub type {
    return ( ( ref $_[0] ) =~ m/::(\w+)$/ )[0];
}

sub to_json {
    return $Geo::JSON::json->encode(shift);
}

sub TO_JSON {
    my $self = $_[0];

    my %output = (
        type => $self->type,
        %{$self},
    );

    delete $output{crs}
        unless defined $output{crs};

    return \%output;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Geo::JSON::Base - Base class for Geo::JSON objects

=head1 VERSION

version 0.002

=head1 AUTHOR

Michael Jemmeson <mjemmeson@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Michael Jemmeson <mjemmeson@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
