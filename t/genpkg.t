use Test::More tests => 3;

BEGIN { use_ok "Class::Mix", qw(genpkg); }

{
	no warnings;
	$Class::Mix::__GP1::foo = 1;
}

is(genpkg, "Class::Mix::__GP0");
is(genpkg, "Class::Mix::__GP2");
