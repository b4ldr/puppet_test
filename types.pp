$foo = Integer.assert_type(1)
$bar = String.assert_type('1')
$foobar = $foo + $bar
$barfoo = $bar + $foo
notice(type($foobar))
notice($foobar)
notice(type($barfoo))
notice($barfoo)
