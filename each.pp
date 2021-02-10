$foo = {
  'one' =>  [1,2,3],
  'two' =>  [1,2,3],
}
$bar = $foo.map |$key, $value| { $value }.flatten
$foo.each |$key, $value| {
  if $bar1 {
    $bar1 = $bar1 + $value
  } else {
    $bar1 = $value
  }
}.flatten
notice($bar1)
notice($foo.values.flatten)
