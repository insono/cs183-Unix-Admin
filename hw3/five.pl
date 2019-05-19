#!/usr/local/bin/perl
my $filename = $ARGV[0];
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

my $outputFile = 'out';
open(my $fh2, '>', $outputFile)
  or die "Could not open file '$outputFile' $!";

while (my $row = <$fh>) {
  chomp $row;
  foreach my $a(@ARGV[1..$#ARGV]) {
    if ($row =~ /$a/) { undef $row }
  }
  if (defined $row) { print $fh2 "$row\n"; }
}
rename $outputFile, $filename
