class test (
    $foo = undef,
    $bar = 'bar',
){
    $array = [$foo, $bar].delete_undef_values
    notice($array)
}
include test
