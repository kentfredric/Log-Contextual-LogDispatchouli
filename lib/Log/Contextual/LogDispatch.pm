use strict;
use warnings;

package Log::Contextual::LogDispatch;
BEGIN {
  $Log::Contextual::LogDispatch::AUTHORITY = 'cpan:KENTNL';
}
{
  $Log::Contextual::LogDispatch::VERSION = '0.001000';
}

# ABSTRACT: Proxy Log::Dispatch without getting wrong carp levels

use Moo;

extends 'Log::Contextual::Router';

around handle_log_request => sub {
    my ( $orig, $self, %message_info ) = @_;
    require Carp;
    local $Carp::CarpLevel = $Carp::CarpLevel;
    $CarpLevel = $message_info{caller_level} + 1;
    return $self->$orig( %message_info );
};



__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Log::Contextual::LogDispatch - Proxy Log::Dispatch without getting wrong carp levels

=head1 VERSION

version 0.001000

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
