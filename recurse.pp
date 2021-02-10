file {'/tmp/dhcp1':
  ensure  => directory,
  source  => '/tmp/source/',
  owner   => 'root',
  purge   => false,
  recurse => true,
}
file {'/tmp/dhcp1/empty' : ensure => file}
file {'/tmp/dhcp2':
  ensure  => directory,
  source  => '/tmp/source/',
  owner   => 'root',
  recurse => remote,
}
file {'/tmp/dhcp2/empty' : ensure => file}
file {'/tmp/dhcp3':
  ensure  => directory,
  source  => '/tmp/source/',
  owner   => 'root',
  purge   => true,
  recurse => true,
}
file {'/tmp/dhcp3/empty' : ensure => file}
