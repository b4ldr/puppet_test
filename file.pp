#file {'/tmp/foobar/.':
#    path  => '/tmp/foobar/.',
#    owner => 'root',
#    mode  => '0770',
#}
#file {'/tmp/foobar/':
#    owner   => 'mysql',
#    mode    => '0600',
#    recurse => true,
#    ignore  => '.',
#}
if find_file('/tmp/foo_bar') {
    file {'/tmp/foo':
        ensure  => file,
        source  => 'file:///tmp/foo_bar',
    }
} else {
    warning('file not found')
}
