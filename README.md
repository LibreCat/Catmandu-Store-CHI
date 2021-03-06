# NAME

Catmandu::Store::CHI - a CHI backed caching store

# SYNOPSIS

    # From the command line
    $ catmandu export CHI --driver File --root_dir /data to YAML
    $ catmandu import JSON to CHI --driver File --root_dir /data < data.json

    # From perl
    use Catmandu;

    my $store = Catmandu->store('CHI', driver => 'File' , root_dir => '/data');

    $store->bag->each(sub {
         my $item = shift;
         ...
    });

    $store->bag->add({ test => 123 });

# METHODS

## new()

## new(driver => $chi\_driver, \[OPT => VAL, OPT2 => VAL\])

Create a new Catmandu::Store::CHI with a $chi\_driver and optional parameters. When no driver is given
then by default the 'Memory' driver will be used. See [CHI](https://metacpan.org/pod/CHI) for more documentation on possible drivers.

# INHERITED METHODS

This Catmandu::Store implements:

- [Catmandu::Store](https://metacpan.org/pod/Catmandu::Store)

Each Catmandu::Bag in this Catmandu::Store implements:

- [Catmandu::Bag](https://metacpan.org/pod/Catmandu::Bag)

# SEE ALSO

[CHI](https://metacpan.org/pod/CHI)

# AUTHOR

Patrick Hochstenbach, `<patrick.hochstenbach at ugent.be>`

# LICENSE AND COPYRIGHT

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.
