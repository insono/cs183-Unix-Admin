#!/usr/local/bin/perl

my $filename = $ARGV[0];
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";
my $outputFile = 'hourlyInfo';
open(my $fh2, '>', $outputFile)
  or die "Could not open file '$outputFile' $!";

$postfix = 0;
$amavis = 0;
$oldMinute = 00;

while (my $row = <$fh>) {
  chomp $row;
  if ($row =~ /postfix/) {$postfix++;}
  if ($row =~ /amavis/) {$amavis++;}
  my ($month, $day, $hours, $minutes, $seconds) = ($row =~ m/(\w+)  (\d+) (\d+):(\d+):(\d+)/);
  if ($minutes > $oldMinute) {
    print $fh2 "$month  $day $hours:$minutes [postfix rejects:$postfix]  [amavis quarantines:$amavis]\n";
    $oldMinute = $minutes;
    $postfix = 0;
    $amavis = 0;
   }

}
print "done\n";
