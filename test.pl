
############This Program is to create an Filer Object
and by using that object create an Aggregate by manuall entering the Aggreate name#####

use NetApp::Filer;
use NetApp::Aggregate;
use strict;
use warnings;
no warnings "all";
use English;
use Carp;
our $VERSION = '500.002';
$VERSION = eval $VERSION;
use Class::Std;
use Params::Validate qw( :all );
use Regexp::Common;
use NetApp::Aggregate::Plex;
use NetApp::Aggregate::RAIDGroup;

#### This is to create an Filer Object######

my $hotname='192.168.227.129';
my ($filer) = NetApp::Filer -> new({
                        hostname => $hotname,
                  });

#### This is to create an Aggregate using Filer Object######

print "Please Enter Aggregate Name\n:";
my $aggr_name=<STDIN>;
chop($aggr_name);

#### make default RAID Size to 12#####
my $raid_size =12;

##### make default Disk Count to 4#####
my $disk_count = 4;

my $aggr=$filer->create_aggregate(
                        name => $aggr_name,
                        raidtype => 'raid4',
                        disktype =>'FCAL',
                        diskcount => $disk_count,
                        raidsize => $raid_size,
                        force => 1,
                        #disks => [ 'v4.21','v4.20','v4.28','v4.33'],
                    );

