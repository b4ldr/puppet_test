$foo = {'apt' => {'eqiad' => ['foo']}}
$bar = {'apt' => {'eqiad' => ['bar']}}
notice($foo.deep_merge($bar))
#$bar = $foo.map |$key, $value| { [$key,  $value] }
#$bar = $foo['three']
#if $bar {
#  notice("bar: ${bar} .")
#} else {
#  notice("foo ${bar} .")
#}
