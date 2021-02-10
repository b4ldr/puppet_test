$a = ['foo', 'bar']
$b = 'foo'
$c = $a.map |$i| {
    ($i == $b) ? {
        true    => 'localhost:11211',
        default => "${i}:11214",
    }
}
notice($c)
