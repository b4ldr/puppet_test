#$a = ['[as]dd]', 'asd']
#$b = $a.map |$i| { $i.regsubst(/[\[\]]/, '', 'G') }
$a = {'foo' => 'bar', 'user' => 'password', 'remove' => undef}
$b = $a.map |$u, $p| {
    if $p { [$u, $p] }
}
notice(Hash($b,1))
