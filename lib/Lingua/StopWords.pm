package Lingua::StopWords;

use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	getStopWords
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our $VERSION = '0.01';

sub getStopWords {
	my ($language) = @_;

	return undef unless $language;

	$language = uc($language);
	eval { require "Lingua/StopWords/$language.pm"; };
	return undef if $@;

	no strict;
	return &{"Lingua::StopWords::$language\::getStopWords"};
}

1;

__END__

=head1 NAME

Lingua::StopWords - Stop words for several languages

=head1 SYNOPSIS

  use Lingua::StopWords;

  my @words = ...;

  my $stopwords = Lingua::StopWords::getStopWords('en');
  my $stopwords = Lingua::StopWords::EN::getStopWords();
  
  # Print non-stopwords in @words
  print join ' ', grep { !$stopwords->{$_} } @words;

=head1 DESCRIPTION

Stopword list are encoded in UTF8.

The current supported languages are:

=over 4

=item * English

=item * French 

=item * Spanish 

=item * Portuguese 

=item * Italian 

=item * German 

=item * Dutch 

=item * Swedish 

=item * Norwegian 

=item * Danish 

=item * Russian 

=item * Finnish 

=back

=head2 EXPORT

None by default.

=head1 SEE ALSO

The stopword lists was taken from the http://snowball.tartarus.org/ website.

This POD documentation inspired from the Lingua::EN::StopWords module.

=head1 AUTHOR

Fabien POTENCIER, E<lt>fabpot@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004 by Fabien POTENCIER

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.3 or,
at your option, any later version of Perl 5 you may have available.


=cut
