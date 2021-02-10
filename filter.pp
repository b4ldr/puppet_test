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
$foo = {'valid'  => true, 'false' => false, 'undef' => undef, 'empty_array' => [], 'empty_hash' => {}}
$bar = $foo.filter |$key, $value| { $value =~ Boolean or !$value.empty() }
notice($bar)
