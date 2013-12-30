use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.037

use Test::More  tests => 16 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'Geo/JSON.pm',
    'Geo/JSON/Base.pm',
    'Geo/JSON/CRS.pm',
    'Geo/JSON/Feature.pm',
    'Geo/JSON/FeatureCollection.pm',
    'Geo/JSON/GeometryCollection.pm',
    'Geo/JSON/LineString.pm',
    'Geo/JSON/MultiLineString.pm',
    'Geo/JSON/MultiPoint.pm',
    'Geo/JSON/MultiPolygon.pm',
    'Geo/JSON/Point.pm',
    'Geo/JSON/Polygon.pm',
    'Geo/JSON/Role/Geometry.pm',
    'Geo/JSON/Role/ToJson.pm',
    'Geo/JSON/Types.pm',
    'Geo/JSON/Utils.pm'
);



# fake home for cpan-testers
use File::Temp;
local $ENV{HOME} = File::Temp::tempdir( CLEANUP => 1 );


my $inc_switch = -d 'blib' ? '-Mblib' : '-Ilib';

use File::Spec;
use IPC::Open3;
use IO::Handle;

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    open my $stdin, '<', File::Spec->devnull or die "can't open devnull: $!";
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, $^X, $inc_switch, '-e', "require q[$lib]");
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';
    my @_warnings = <$stderr>;
    waitpid($pid, 0);
    is($?, 0, "$lib loaded ok");

    if (@_warnings)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};


