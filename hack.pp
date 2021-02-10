$foo = {
    'one' => ['1'],
    'two' => $foo['one'] + [2],
}
notice($foo)
