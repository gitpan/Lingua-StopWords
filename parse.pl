#!/usr/bin/perl

# use to automatically generate the Lingua::StopWords::XX modules.
use lib qw(lib);
use strict;
use File::Path;
use Lingua::StopWords;
use Encode;

rmtree "lib/Lingua/StopWords";
mkpath "lib/Lingua/StopWords";

my $module = qq|package Lingua::StopWords::[[LANGUAGE]];

use strict;
use warnings;

require Exporter;
our \@ISA = qw(Exporter);

our \%EXPORT_TAGS = ( 'all' => [ qw(
	getStopWords
) ] );

our \@EXPORT_OK = ( \@{ \$EXPORT_TAGS{'all'} } );

our \$VERSION = $Lingua::StopWords::VERSION;

sub getStopWords {
	my %h = map { \$_, 1 } qw([[WORDS]]);

	return \\\%h;
}

1;
|;

my $manifest;
open(F, "<MANIFEST");
{ local $/; $manifest = <F>; }
close(F);

$manifest =~ s#^lib/Lingua/StopWords/.+?\.pm\s*##gms;
$manifest =~ s#^snowball_files/.+?\.txt\s*##gms;

my @files = glob("snowball_files/*.txt");
foreach my $file (@files) {
	if ($file =~ m#snowball_files/(\w+)\.txt#) {
		my $language = uc($1);
		print STDERR "Generating '$language' stopword list module\n";

		my $words;
		open(F, "<$file");
		{ local $/; $words = <F>; }
		close(F);

		$words =~ s#\|.+?$##gm;
		$words =~ s#\s+# #g;
		$words =~ s#^ ##g;
		$words =~ s# $##g;

		my $mod = $module;
		$mod =~ s/\[\[LANGUAGE\]\]/$language/g;
		$mod =~ s/\[\[WORDS\]\]/$words/g;
		Encode::from_to($mod, "iso-8859-1", "utf8");

		open(F, ">lib/Lingua/StopWords/$language.pm");
		print F $mod;
		close(F);

		$manifest .= qq|\nlib/Lingua/StopWords/$language.pm|;
		$manifest .= qq|\n$file|;
	}
}

$manifest =~ s#\n+#\n#g;

open(F, ">MANIFEST");
print F $manifest;
close(F);
