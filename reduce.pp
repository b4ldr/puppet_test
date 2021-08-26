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
#$foo = {'valid'  => true, 'false' => false, 'undef' => undef}
#$bar = $foo.reduce({}) |$memo, $value| {
#    unless $value[1] == undef {
#        merge($memo, {$value[0] => $value[1]})
#    } else { $memo }
#}
#notice($bar)
$d = {'sda' => 'ssd', 'sdb' => 'ssd', 'sdc' => 'hdd'}
$type_count = $d.reduce({'ssd'=> 0, 'hdd' => 0}) |$memo, $value| {
  $value[1] == 'ssd' ? {
    true    => { 'hdd' => $memo['hdd'], 'ssd'  => $memo['ssd'] + 1 },
    default => { 'hdd' => $memo['hdd'] + 1, 'ssd'  => $memo['ssd'] },
  }
}
$type = ($type_count['ssd'] > $type_count['hdd']).bool2str('ssd', 'hdd')
notice($type)
