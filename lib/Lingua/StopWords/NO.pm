package Lingua::StopWords::NO;

use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	getStopWords
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our $VERSION = 0.01;

sub getStopWords {
	my %h = map { $_, 1 } qw(og i jeg det at en den til er som på de med han av ikke inte der så var meg seg men ett har om vi min mitt ha hade hu hun nå over da ved fra du ut sin dem oss opp man kan hans hvor eller hva skal selv sjøl her alle vil bli ble blei blitt kunne inn når være kom noen noe ville dere de som deres kun ja etter ned skulle denne for deg si sine sitt mot å meget hvorfor sia sidan dette desse disse uden hvordan ingen inga din ditt blir samme hvilken hvilke sånn inni mellom vår hver hvem vors dere deres hvis både båe begge siden dykk dykkar dei deira deires deim di då eg ein ei eit eitt elles honom hjå ho hoe henne hennar hennes hoss hossen ikkje ingi inkje korleis korso kva kvar kvarhelst kven kvi kvifor me medan mi mine mykje no nokon noka nokor noko nokre si sia sidan so somt somme um upp vere er var vore verte vort varte vart er være var å);

	return \%h;
}

1;
