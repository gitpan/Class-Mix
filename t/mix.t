use Test::More tests => 10;

BEGIN { use_ok "Class::Mix", qw(mix_class); }

{ package Foo; }
{ package Bar; }
{ package Baz; }

# trivial cases
is(mix_class(), "UNIVERSAL");
is(mix_class("Foo"), "Foo");

# complex case
my $foobar = mix_class("Foo", "Bar");
is_deeply(\@{$foobar."::ISA"}, ["Foo", "Bar"]);
ok($foobar->isa("Foo"));
ok($foobar->isa("Bar"));
ok(!$foobar->isa("Baz"));

# consistency of results
is(mix_class(), "UNIVERSAL");
is(mix_class("Foo"), "Foo");
is(mix_class("Foo", "Bar"), $foobar);
