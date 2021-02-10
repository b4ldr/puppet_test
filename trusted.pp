$bar = {}
$foo = $bar['certname'] ? {
    undef   => 'fact',
    default => 'trusted',
}
notice($foo)
