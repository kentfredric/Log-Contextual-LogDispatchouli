use strict;
use warnings;

package Log::Contextual::Router::LogDispatchouli;

# ABSTRACT: Proxy Log::Dispatchouli without getting wrong carp levels

use Moo;

extends 'Log::Contextual::Router';

=method C<handle_log_request>

This is simply a wrapper around L<< C<Log::Contextual::Router::handle_log_request>|Log::Contextual::Router/handle_log_request >> that locally sets C<$Carp::CarpLevel> to the value needed so L<< C<Log::Dispatchouli>|Log::Dispatchouli >> reports errors from the right place.

=cut

around handle_log_request => sub {
  my ( $orig, $self, %message_info ) = @_;
  require Carp;
  ## no critic (ProhibitPackageVars)
  $message_info{caller_level}++;
  local $Carp::CarpLevel = $message_info{caller_level};
  return $self->$orig(%message_info);
};

no Moo;

1;
