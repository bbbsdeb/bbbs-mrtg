package BBBS::MRTG;

use warnings;
use strict;

use Carp;

=head1 NAME

BBBS::MRTG - Perl Module for reading the MRTG information from the BBBS standard port.

=head1 VERSION

Version 0.05

=cut

our $VERSION = '0.05';


=head1 SYNOPSIS

This module provides functions that can be used to read the statistical
information which can be provided by BBBS and returns that information
as a hash reference.

Perhaps a little code snippet.

    use BBBS::MRTG;

    my $foo = BBBS::MRTG->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 bbbs_mrtg_io

=cut

sub bbbs_mrtg_io {
}

=head2 bbbs_mrtg_user

=cut

sub bbbs_mrtg_user {
}

=head2 read_bbbs_mrtg

=cut

sub read_bbbs_mrtg {

    my $config = shift;

    use IO::Socket;

    my ($socket, %bbbs_mrtg);

    #
    $socket = IO::Socket::INET->new(
        PeerAddr => ${$config}{'host'},
        PeerPort => 16_425,        # standard BBBS port
        Proto    => 'tcp',
        Type     => SOCK_STREAM
    ) or croak "Could not open port.\n";

    print {$socket} "${$config}{'type'}\n";

    $bbbs_mrtg{'line_one'} = <$socket>;
    $bbbs_mrtg{'line_two'} = <$socket>;
    $bbbs_mrtg{'time'} = <$socket>;

    close $socket or croak "Unable to close socket.\n";

    return(\%bbbs_mrtg);

}

=head1 AUTHOR

Robert James Clay, C<< <jame at rocasa.us> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-bbbs-mrtg at rt.cpan.org>,
or through the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=BBBS-MRTG>.
I will be notified, and then you'll automatically be notified of progress on your
bug as I make changes.

=head1 HISTORY

The traffic statistics for BBBS can be obtained periodically directly from
the BBS, using the capability that BBBS has to provide information usable by
MRTG (Multi Router Traffic Grapher) to display such statistics. The BBBS
documention has a writeup on a python script which can be used to collect
the information from an operational BBBS system; not being content with that,
and knowing that python is not available in as many places as Perl, I created
a Perl version of the script which I named mrtgbbbs.pl. From that, the Perl
Module BBBS::MRTG was created.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc BBBS::MRTG


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=BBBS-MRTG>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/BBBS-MRTG>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/BBBS-MRTG>

=item * Search CPAN

L<http://search.cpan.org/dist/BBBS-MRTG/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2000-2012 Robert James Clay.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of BBBS::MRTG
