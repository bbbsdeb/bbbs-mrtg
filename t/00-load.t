#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'BBBS::MRTG' ) || print "Bail out!
";
}

diag( "Testing BBBS::MRTG $BBBS::MRTG::VERSION, Perl $], $^X" );
