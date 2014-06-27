package Catmandu::Store::CHI::Bag;

use Moo;
use Data::UUID;
use Data::Dumper;

with 'Catmandu::Bag';

sub generator {
    my $self = shift;
    my $keys = [ $self->store->chi->get_keys ];
    sub {
        my $id = pop @$keys;

        return undef unless $id;

        $self->get($id);
    };
}

sub get {
    my ($self,$id) = @_;
    $self->store->chi->get($id);
}

sub add {
    my ($self,$data) = @_;
    $data->{_id} //= gen_id();
    my $id = $data->{_id};
    $self->store->chi->set($id,$data);
    return $data;
}

sub delete {
    my ($self,$id) = @_;
    $self->store->chi->remove($id);
}

sub delete_all {
    my ($self) = @_;
    $self->store->chi->clear();
}

sub gen_id {
    Data::UUID->new->create_str();
}

package Catmandu::Store::CHI;

use Moo;
use CHI;

with 'Catmandu::Store';

has 'driver' => (is => 'ro' , required => 1 , default => sub { 'Memory' });
has 'opts'   => (is => 'rw');
has 'chi'    => (is => 'ro' , lazy => 1 , builder => 1);

sub _build_chi {
    my ($self) = @_;
    my $driver = $self->driver;
    my $opts   = $self->opts;

    CHI->new(driver => $driver, %$opts);
}

sub BUILD {
    my ($self,$opts) = @_;

    if (keys %$opts == 0) {
        $opts->{global} = 1;
    }

    delete $opts->{driver};

    $self->opts($opts);
}

1; 
