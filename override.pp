$true = true
file {'/tmp/foobar':
    ensure => file,
    owner  => 'root',
}
if $true {
    File['/tmp/foobar'] {
        owner => 'jbond'
    }
}
