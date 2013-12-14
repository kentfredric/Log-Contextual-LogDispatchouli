use strict;
use warnings;
use utf8;
package Log::Contextual::LogDispatch;
BEGIN {
  $Log::Contextual::LogDispatch::AUTHORITY = 'cpan:KENTNL';
}
{
  $Log::Contextual::LogDispatch::VERSION = '0.001000';
}

# ABSTRACT: A Log::Dispatch specific wrapper for Log::Contextual

use Moo;

extends 'Log::Contextual';

sub router {
    return 'Log::Contextual::Router::LogDispatch';
}

no Moo;
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Log::Contextual::LogDispatch - A Log::Dispatch specific wrapper for Log::Contextual

=head1 VERSION

version 0.001000

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
