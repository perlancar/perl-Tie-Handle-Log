package Tie::Handle::Log;

# DATE
# VERSION

use strict;
use warnings;
use Log::ger;

sub TIEHANDLE {
    my $class = shift;

    log_trace "TIEHANDLE(%s, %s)", $class,\@_;
    bless [], $class;
}

sub WRITE {
    my $this = shift;
    log_trace "WRITE(%s)", \@_;
}

sub PRINT {
    my $this = shift;
    log_trace "PRINT(%s)", \@_;
}

sub PRINTF {
    my $this = shift;
    log_trace "PRINTF(%s)", \@_;
}

sub READ {
    my $this = shift;
    log_trace "READ(%s)", \@_;
}

sub READLINE {
    my $this = shift;
    log_trace "READLINE()";
}

sub GETC {
    my $this = shift;
    log_trace "GETC()";
}

sub EOF {
    my ($this, $int) = @_;
    log_trace "EOF(%d)", $int;
}

sub CLOSE {
    my $this = shift;
    log_trace "CLOSE()";
}

sub UNTIE {
    my ($this) = @_;
    log_trace "UNTIE()";
}

# DESTROY

1;
# ABSTRACT: Tied filehandle that just logs operations

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Tie::Handle::Log;

 tie *FH, 'Tie::Handle::Log';

 # use like you would a regular filehandle
 print FH "one", "two";
 ...
 close FH;


=head1 DESCRIPTION

This class implements tie interface for filehandle but does nothing except
logging the operation with L<Log::ger>. It's basically used for testing,
benchmarking, or documentation only.


=head1 SEE ALSO

L<perltie>

L<Log::ger>

L<Tie::FileHandle::Log>

L<Tie::Scalar::Log>, L<Tie::Array::Log>, L<Tie::Hash::Log>.

L<Tie::Handle>

L<Tie::Simple>

=cut
