package CustomError::Plugin;
use strict;
use File::Spec;
use MT::FileMgr;

sub _cb_tp_error {
    my ( $cb, $app, $tmpl ) = @_;
    my $plugin = MT->component( 'CustomError' );
    my $alt_tmpl = File::Spec->catfile( $plugin->path, 'tmpl', 'error.tmpl' );
    my $fmgr = MT::FileMgr->new( 'Local' ) or die MT::FileMgr->errstr;
    if ( $fmgr->exists( $alt_tmpl ) ) {
        my $error = $fmgr->get_data( $alt_tmpl );
        $$tmpl = $error;
    }
}

1;