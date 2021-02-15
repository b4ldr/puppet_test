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
user { $name:
    ensure   => $ensure,
    comment  => "$email",
    home     => "/home/$name",
    password => $password,
    shell    => $shell,
    uid      => $uid,
    gid      => $group,
}
if $groups {
  User[$name] {
    groups => $groups
  }
}

