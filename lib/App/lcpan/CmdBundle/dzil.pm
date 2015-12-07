package App::lcpan::CmdBundle::dzil;

# DATE
# VERSION

1;
# ABSTRACT: lcpan subcommands related to Dist::Zilla

=head1 SYNOPSIS

Install this distribution, then the lcpan subcommands below will be available:

 # List plugins available on CPAN
 % lcpan dzil-plugins

 # List bundles available on CPAN
 % lcpan dzil-bundles

 # List roles available on CPAN
 % lcpan dzil-roles


 # Find plugins most depended by other CPAN distributions
 % lcpan dzil-plugins-by-rdep-count

 # Find bundles most depended by other CPAN distributions
 % lcpan dzil-bundles-by-rdep-count

 # Find roles most depended by other CPAN distributions
 % lcpan dzil-roles-by-rdep-count


 # Who release the largest number of plugins
 % lcpan dzil-authors-by-plugin-count

 # Who release the largest number of bundles
 % lcpan dzil-authors-by-bundle-count

 # Who release the largest number of roles
 % lcpan dzil-authors-by-role-count


=head1 DESCRIPTION

This distribution packages several lcpan subcommands related to L<Dist::Zilla>.


=head1 SEE ALSO

L<lcpan>

L<Dist::Zilla>
