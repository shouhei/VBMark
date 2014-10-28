binmode STDOUT, ":utf8F";

use strict;
use warnings;
use utf8;
use File::Path;
use File::Spec;

my $result_file = $ARGV[0];
chomp($result_file);
unless ($result_file){
    print "please appoint the result file";
}

my $obj = $ARGV[1];
chomp($obj);
unless($obj){
    print "please appoint the subject directory";
}

open(FILE, ">> $result_file");
print FILE "[\n";
for(glob("$obj/*")){
    if($_ =~ /txt/){
        next;
    }
    $_ =~ /a[0-9]*/;
    my $number = $&;
    $number =~ s/a/1/g;
    print $number . ":";
    my $abs_file = File::Spec->rel2abs($_);
    unless($abs_file =~ /.exe$/){
        next; 
    }
    system($abs_file);
    print FILE '{"id":' . $number . ",";
    my $score = <STDIN>;
    chomp($score);
    print  FILE '"score":'.$score. "},\n";
}
print FILE "]";
