$foo = 'foo'
if $foo =~ '^f' {
    notice($foo)
}
if $foo =~ '^00' {
    notice("bar")
}
