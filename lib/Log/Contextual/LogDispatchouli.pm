use strict;
use warnings;
use utf8;

package Log::Contextual::LogDispatchouli;

# ABSTRACT: A Log::Dispatchouli specific wrapper for Log::Contextual

use Moo;

extends 'Log::Contextual';

## no critic (ProhibitPackageVars, Capitalization)
our $Router_Instance;

sub router {
  return (
    $Router_Instance ||= do {
      require Log::Contextual::Router::LogDispatchouli;
      Log::Contextual::Router::LogDispatchouli->new;
      }
  );
}

no Moo;
1;

