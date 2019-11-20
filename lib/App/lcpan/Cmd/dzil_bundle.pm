package App::lcpan::Cmd::dzil_bundle;

# DATE
# DIST
# VERSION

use 5.010;
use strict;
use warnings;

use Hash::Subset 'hash_subset_without';
require App::lcpan;

our %SPEC;

our %dzil_bundle_args = (
    dzil_bundle => {
        schema => 'perl::modname*',
        req => 1,
        pos => 0,
        completion => sub {
            my %args = @_;

            my $word = $args{word} // '';
            my $res = App::lcpan::_complete_mod(
                %args,
                word => "Dist::Zilla::PluginBundle::$word",
            );
            for (@$res) { s!^Dist(::|/)Zilla(::|/)PluginBundle(::|/)!! }
            $res;
        },
    },
);

$SPEC{handle_cmd} = {
    v => 1.1,
    summary => 'Show a single Dist::Zilla plugin bundle',
    args => {
        %App::lcpan::common_args,
        %dzil_bundle_args,
    },
};
sub handle_cmd {
    my %args = @_;

    my $res = App::lcpan::modules(
        hash_subset_without(\%args, ['module']),
        query => ["Dist::Zilla::PluginBundle::$args{dzil_bundle}"],
        query_type => 'exact-name',
        detail => 1,
    );
    return $res unless $res->[0] == 200;
    for my $entry (@{ $res->[2] }) {
        $entry->{name} = $entry->{module};
        $entry->{name} =~ s/^Dist::Zilla::PluginBundle:://;
    }
    unshift @{ $res->[3]{'table.fields'} }, 'name';
    $res;
}

1;
# ABSTRACT:
