File {
    owner => 'root'
}
class foo{
    file {'/tmp/foobar':
        ensure => file,
    }
    File<| title == ['/tmp/foobar'] |> {
        owner => 'jbond',
    }
}
include foo
