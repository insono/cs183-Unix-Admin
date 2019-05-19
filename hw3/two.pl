#!/usr/local/bin/perl
use List::Util qw(reduce);
use Data::Dumper;

my $filename = 'log2';
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

$knownCount = 0;
$unknownCount = 0;
my %known;
my %unknown;

while (my $row = <$fh>) {
  chomp $row;
  my ($ip) = ($row =~ /(\[\d+\.\d+\.\d+\.\d+\])/);
  if ($row =~ / connect from/) { 
    if ($row =~ /unknown/) {
      $unknownCount++;
      $unknown{$ip}++;
    }
    else {
      $knownCount++;
      $known{$ip}++;
    }
  }
}
#print Dumper(\%known);
$highKnown = List::Util::reduce { $known{$b} > $known{$a} ? $b : $a } keys %known;
print "Total Known connections: $knownCount - $highKnown accounts for $known{$highKnown} connections\n";
$highUnknown = List::Util::reduce { $unknown{$b} > $unknown{$a} ? $b : $a } keys %unknown;
print "Total Unknown connections: $unknownCount = $highUnknown accounts for $unknown{$highUnknown} connections\n";
