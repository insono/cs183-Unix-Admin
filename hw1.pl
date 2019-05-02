#!/usr/bin/perl

foreach (@files = @ARGV) {
   my $filename = $_;
   open(my $fh, '<', $filename);
   while (my $line = <$fh>) {
      chomp $line;
      print"$line\n";
   }
}
