define my_log {
  file { "/tmp/${name}.log":
    ensure => 'file',
    mode   => '0644',
  }
}
$foo = {
    'blue' =>  'http://foobar.com',
    'red' =>  'http://barfoo.com',
}
my_log{$foo.keys(): }
