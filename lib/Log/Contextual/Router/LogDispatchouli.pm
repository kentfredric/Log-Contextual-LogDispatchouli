use strict;
use warnings;

package Log::Contextual::Router::LogDispatchouli;

# ABSTRACT: Proxy Log::Dispatchouli without getting wrong carp levels

use Moo;

extends 'Log::Contextual::Router';

around handle_log_request => sub {
    my ( $orig, $self, %message_info ) = @_;
    require Carp;
    ## no critic (ProhibitPackageVars)
    local $Carp::CarpLevel = $Carp::CarpLevel;
    $Carp::CarpLevel = $message_info{caller_level} + 1;
    return $self->$orig( %message_info );
};



__PACKAGE__->meta->make_immutable;
no Moose;

1;
