package App::lcpan::Cmd::dzil_roles;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;

require App::lcpan;

our %SPEC;

$SPEC{handle_cmd} = {
    v => 1.1,
    summary => 'List Dist::Zilla roles available on CPAN',
    args => {
        %App::lcpan::common_args,
        %App::lcpan::query_multi_args,
        %App::lcpan::fauthor_args,
        %App::lcpan::fdist_args,
        %App::lcpan::flatest_args,
        %App::lcpan::sort_modules_args,
    },
};

sub handle_cmd {
    my %args = @_;

    my $res = App::lcpan::modules(%args, namespaces=>['Dist::Zilla::Role']);

    for (@{$res->[2]}) {
        if ($args{detail}) {
            $_->{name} =~ s/^Dist::Zilla::Role:://;
        } else {
            s/^Dist::Zilla::Role:://;
        }
    }

    $res;
}

1;
# ABSTRACT:
