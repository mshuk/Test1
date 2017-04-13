
use strict;
use warnings;


my $file1 = 'FIRST.txt';
# undef $/ to read whole file in in one go
undef $/;
open FILE1, $file1 or die "Can't open $file1 $!\n";

# binmode FILE to supress conversion of line endings
binmode FILE1;
my $data1 = <FILE1>;

# convert data to binary form
my $bin = unpack 'B*', $data1;
#print $bin;

my $file2 = 'SECOND.bin';
open (my $FILE2, '+>', $file2) or die "Could not open '$file2' $!";
print $FILE2 $bin;

close FILE1;
close $FILE2;

my $file3 = 'SECOND.bin';
# undef $/ to read whole file in in one go
undef $/;
open FILE3, $file3 or die "Can't open $file3 $!\n";

# binmode FILE to supress conversion of line endings
binmode FILE3;
my $data3 = <FILE3>;

# convert binary to string text
my $stringtxt = pack 'B*', $data3;
my $string_len =  length($stringtxt);
my $lengthstart = $string_len - 1;

my $strconcat;
#substring $stringtxt in inverse order
for( $a = $lengthstart; $a >= 0; $a = $a - 1 ){
    my $fragment =  substr $stringtxt, $a, 1;
    $strconcat .= $fragment;
}
print $strconcat;

#write file into THIRD.txt
my $file4 = 'THIRD.txt';
open (my $FILE4, '+>', $file4) or die "Could not open '$file4' $!";
print $FILE4 $strconcat;

close FILE3;
