#$bar = $foo.reduce([]) |$memo, $value| {
#    $value['foo'] ? {
#        true    => $memo + [$value],
#        default => $memo,
#    }
#}
#$cmd = '/bin/mkdir'
#$mypath = '/srv/*'
#$bar = [' *', '..*'].reduce("${cmd} ${mypath}") |$memo, $value| {
#    "${memo}, !${cmd} ${mypath}${value}"
#}
$foo = {'valid'  => true, 'false' => false, 'undef' => undef}
$bar = $foo.reduce({}) |$memo, $value| {
    unless $value[1] == undef {
        merge($memo, {$value[0] => $value[1]})
    } else { $memo }
}
notice($bar)
