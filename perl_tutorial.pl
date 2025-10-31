#!/usr/bin/env perl
use strict;
use warnings;

print "\n=== Perl Tutorial (Interactive) ===\n";

# 1. Scalars
my $name = "Anon";
my $age  = 20;
my $pi   = 3.1415;
print "\n1. Scalars\n";
print "Name: $name, Age: $age, Pi: $pi\n";

# Exercise
print "Enter your name: ";
chomp(my $user_name = <STDIN> // '');
$user_name ||= 'Friend';
print "Hello, $user_name!\n";

# 2. Arrays
my @colors = ("red", "green", "blue");
print "\n2. Arrays\n";
print "Colors: @colors\n";
push @colors, "yellow";
print "After push: @colors\n";
pop @colors;
print "After pop: @colors\n";

# Exercise
print "Enter 3 favorite fruits (space-separated): ";
chomp(my $input = <STDIN> // '');
my @fruits = $input ? split ' ', $input : ();
print "You like: " . (@fruits ? join(', ', @fruits) : 'none') . "\n";

# 3. Hashes
my %person = ( name => "Hasan", city => "Mandi", country => "India" );
$person{college} = "IIT Mandi";
print "\n3. Hashes\n";
print "City: $person{city}, College: $person{college}\n";

# Exercise
print "Enter key=value pairs (comma-separated), e.g. a=1,b=2: ";
chomp(my $pairs = <STDIN> // '');
my %data = ();
if ($pairs) {
    for my $pair (split /,/, $pairs) {
        next unless $pair =~ /=/;
        my ($k, $v) = split(/=/, $pair, 2);
        $k =~ s/^\s+|\s+$//g if defined $k;
        $v =~ s/^\s+|\s+$//g if defined $v;
        $data{$k} = $v;
    }
}
print "Stored:\n";
print "  $_ => $data{$_}\n" for sort keys %data;

# 4. Loops & Conditionals
print "\n4. Loops & Conditionals\n";
if ($age >= 18) { print "Adult\n" } else { print "Minor\n" }

for my $i (1..3) { print "For loop $i\n" }

my $n = 0;
while ($n < 3) { print "While loop $n\n"; $n++ }

# Exercise
print "Enter a number: ";
chomp(my $num = <STDIN> // '');
if ($num =~ /^-?\d+$/) {
    print ($num % 2 == 0) ? "$num is even\n" : "$num is odd\n";
} else {
    print "That's not an integer.\n";
}

# 5. Subroutines
print "\n5. Subroutines\n";
sub greet { my ($who) = @_; return "Hello, $who!" }
print greet("World") . "\n";

# Exercise
print "Who do you want to greet? ";
chomp(my $who = <STDIN> // '');
$who ||= 'Friend';
print greet($who) . "\n";

# 6. Regex
print "\n6. Regular Expressions\n";
my $text = "I love coding in Perl!";
if ($text =~ /Perl/) { print "Found Perl!\n" }
$text =~ s/Perl/Rust/;
print "Modified: $text\n";

# Exercise
print "Enter a sentence: ";
chomp(my $sentence = <STDIN> // '');
if ($sentence =~ /Perl/i) { print "You mentioned Perl!\n" }
$sentence =~ s/\bfun\b/exciting/gi;
print "New sentence: $sentence\n";

# 7. File I/O
print "\n7. File I/O\n";
my $filename = "sample.txt";
open my $fh, '<', $filename or die "Can't open $filename: $!";
print "Reading file:\n";
while (my $line = <$fh>) { print $line }
close $fh;
open $fh, '<', $filename or die "Can't open $filename: $!";
print "Reading file:\n"; print while <$fh>;
close $fh;

# Exercise
print "Enter filename to create: ";
chomp(my $file = <STDIN> // '');
if ($file) {
    open my $out, '>', $file or warn "Can't create $file: $!";
    print $out "Created by Perl script\n" if $out;
    close $out if $out;
    print "File '$file' created.\n";
} else {
    print "No filename provided; skipping.\n";
}

# 8. Command Line Args
print "\n8. Command Line Arguments\n";
print "Script: $0\n";
print "Args: @ARGV\n";

print "Try running: perl perl_tutorial.pl test1 test2 \n";

# 9. Context
print "\n9. Context\n";
my @nums = (1,2,3);
my $count = scalar @nums;
print "Scalar: $count, List: @nums\n";

# Exercise
print "Enter numbers (space-separated): ";
chomp(my $nums_in = <STDIN> // '');
my @vals = $nums_in ? split ' ', $nums_in : ();
print "You entered ", scalar(@vals), " numbers.\n";

# 10. References
print "\n10. References\n";
my $ref_arr  = \@colors;
print "First color via ref: ${$ref_arr}[0]\n";

my $ref_hash = \%person;
print "City via ref: ${$ref_hash}{city}\n";

# Exercise
print "Enter a color index (0-2): ";
chomp(my $idx = <STDIN> // '');
if ($idx =~ /^\d+$/ && $idx >= 0 && $idx < @{$ref_arr}) {
    print "Color at index $idx: ${$ref_arr}[$idx]\n";
} else {
    print "Index out of range or invalid.\n";
}

# 11. File reading with regex
print "\n11. File parsing example\n";
open my $rfh, '<', $filename or warn "Can't open $filename: $!";
if ($rfh) {
    while (<$rfh>) {
        if (/Perl|Rust/) { print "Match in file: $_" }
    }
    close $rfh;
}

print "\nEnd of Tutorial!\n";
