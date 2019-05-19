#!/usr/local/bin/perl
use List::Util qw(reduce);
use Data::Dumper;

my $filename = $ARGV[0];
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

my %from;
my %to;

while (my $row = <$fh>) {
  chomp $row;
  if ($row =~ /from=</) { 
    my ($fromExtract) = ($row =~ /(from=<[\w\.\-\|]+@[\w\.\-\|]+>)/);
    if (defined $fromExtract) {
      $from{$fromExtract}++;
    }
  }
  if ($row =~ /to=</) {
    my ($toExtract) = ($row =~ /(to=<[\w\.\-\|]+@[\w\.\-\|]+>)/);
    if (defined $toExtract) {
      $to{$toExtract}++;
    }
  }
}

my @keys = sort { $from{$b} <=> $from{$a} } keys(%from);
foreach my $key (@keys[0..4]) { print "$key $from{$key}\n"; }
@keys = sort { $from{$b} <=> $from{$a} } keys(%to);
foreach my $key (@keys[0..4]) { print "$key $to{$key}\n"; }
