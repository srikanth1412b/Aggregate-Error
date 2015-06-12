use NetApp::Filer;
use NetApp::Aggregate;
use strict;
use warnings;
use English;
use Carp;
our $VERSION = '500.002';
$VERSION = eval $VERSION;
use Class::Std;
use Params::Validate qw( :all );
use Regexp::Common;

use NetApp::Aggregate::Plex;
use NetApp::Aggregate::RAIDGroup;
my $hotname='192.168.227.129';
my ($filer) = NetApp::Filer -> new({
hostname => $hotname,
});
print "SCRIPT NAME\n:";
my $name=<STDIN>;
chop($name);
my @a=&c($name);
print @a;
sub c(){
no warnings "all";
my $r_s =12;
my $d_c = 4;
my $aggr=$filer->create_aggregate(
name => $name,
raidtype => 'raid4',
disktype =>'FCAL',
diskcount => $d_c,
raidsize => $r_s,
force => 1,
#disks => [ 'v4.21','v4.20','v4.28','v4.33'],
);
print "the Create file is returning the filer boject $filer and AGGREGATE is created";
return $filer;
}

__END__
@a = $filer->get_aggregate_names;
print @a;
$n = "script";
print ">>>$n<<<<\n";
