#!/usr/local/bin/perl
use List::Util qw(reduce);
use Data::Dumper;

my $filename = 'log4';
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

my $rejects = 0;
my %ips;
my %from;
my %to;
my $uniqueIps = 0;
my $uniqueFrom = 0;
my $uniqueTo = 0;

while (my $row = <$fh>) {
  chomp $row;
  if ($row =~ /blocked using dnsbl.sorbs.net/) {
    ($ip) = ($row =~ /(\[\d+\.\d+\.\d+\.\d+\])/);
    ($fromExtract) = ($row =~ /(from=<[\w\.\-\|]+@[\w\.\-\|]+>)/);
    ($toExtract) = ($row =~ /(to=<[\w\.\-\|]+@[\w\.\-\|]+>)/);
    $rejects++;
    if (defined $ip) { $ips{$ip}++; }
    if (defined $fromExtract) { $from{$fromExtract}++; }
    if (defined $toExtract) { $to{$toExtract}++; }
  }
}

print "$rejects messages rejected\n";
for my $key (keys %ips) {
  if ($ips{$key} == 1) { $uniqueIps++; }
}
print "$uniqueIps unique IP's\n";
for my $key (keys %from) { if ($from{$key} == 1) { $uniqueFrom++; } }
print "$uniqueFrom unique from addresses\n";
for my $key (keys %to) { if ($to{$key} == 1) { $uniqueTo++; } }
print "$uniqueTo unique to addresses\n";
