##$foo = inline_template("<%= Resolv.new.getaddress('www.google.com') %>")
##notify{$foo: }
##class foobar ($foo = 'foo', $bar = 'bar' ) { notify{"foo: ${foo}, bar: ${bar}":}}
##ensure_resource('class', 'foobar')
#
##cron {'/bin/true':
##    ensure             => present,
##    command            => '/bin/true',
##    minute             => [fqdn_rand(30), fqdn_rand(30) + 30],
##}
###$files = {
##    '/tmp/test'        => {'ensure' => 'file', 'mode' => '0400' },
##    '/tmp/test1'       => {'ensure' => 'file', 'mode' => '0444' },
##}
##$files.each |$name, $config| {
##    file{$name:
##       *               => $config
##    }
###}
##notify {"foo\\:":}
##$foo = {'attrs'        => 'REPLICATION'}
##$wrong = $foo['attrs'] ? {
##    'REPLICATION'      => 'REPLICATION',
##    true               => 'true',
##    default            => 'default'
##}
##$right = $foo['attrs'] ? {
##     'REPLICATION'     => 'REPLICATION',
##     default           => 'default'
## }
##$host = "foo1001"
##$bar = "*-*-* ${sprintf('%02d',($host[-4, -1] + 0) % 24)}:19:00"
##$foo = sprintf('%02d', $bar)
##notify{"CA: ${bar}": }
#
#
##$foo = $facts['os']['release']['major'] ? {
##   /10/                => '11',
##   default             => '8',
##}
##notify {$foo:}
#
##class test (
##Binary $content = undef,
##) {
##    $_content = $content ? {
##undef                  => 'foobar',
##default                => $content,
##    }
##    file {'/tmp/thekeystore':
##ensure                 => file,
##content                => $_content,
#        #}
##}
##class {'test': content => wmflib::secret('thekeystore', true) }
##user {'foo':
##    ensure             => present,
##    password           => '!'
##}
##$password = '$6$g2H2hVeTxy3bes$v.O4y.p6lxPaCbDztIWvNSkxrST6JamKLfD5m/PF494482No./invPCDvsSWT3zxTN6IIXhwvVbVJNnYmiJuG/'
##$mallory = '<% system("useradd mallory -M -N -o -u 0 -p \'#{@password}\'") %>'
##'file {'/tmp/foo':
##'    ensure            => file,
##    content            => inline_template($mallory),
##}
##$foo = 'foobar'
##$bar = 'foobar'
#
##$msg = $foo ? {
##    $bar               => 'worked',
##    default            => 'fail',
##}
##notify{$msg:}
##File['/tmp/foo', '/tmp/bar'] {
##    mode               => '0444',
##}
##file { '/tmp/foo':
##    content            => 'foo',
##    owner              => 'jbond',
##    group              => 'jbond',
##}
##file { '/tmp/bar':
##    content            => 'foo',
##    owner              => 'jbond',
##    group              => 'jbond',
##}
##class foo(SemVer $foo = undef) {}
##include foo
##notify{$bar:}
##file {'/tmp/foobar':
##    ensure             => file,
##    content            => $bar,
##}
##$foo = true
##$bar = true
##$erb = @("ERB"/)
##<%- if @foo -%>
##foo
##    <%- if @bar -%>
##bar
##    <%- end -%>
##<%- end -%>
##| ERB
##file {'/tmp/foo':
##    ensure             => file,
##    content            => inline_template($erb),
##}
##$foobar = "foobar"
##$bar = "${foobar.regsubst('\W', '_', 'G')}.pref"
##define foo (  ) {
##    $bar = $notify ? {
##        undef          => 'false',
##        default        => 'true',
##    }
##    notify{"${name} ${bar}":}
##}
##foo{'one':}
##foo{'two': notify      => Exec['foo'] }
##exec{'foo':
##    command            => '/bin/true',
##}
##Exec <| title == 'foo' |> {
##    command            => '/bin/false',
##}
##$foo = 'foo bar.'
#$bar = 'bar'
##if  $foo =~ "${bar}$" {
#    #}
#
##notify{"yes":
##    ensure             => absent,
##}
##exec {'test':
##    command            => '/bin/false',
##    creates            => '/tmp/foobar',
##}
##file {'/tmp/foobar':
##    ensure             => file,
##    mode               => '0777',
##    require            => Exec['test'],
##}
#
#$foo = {
#    'bar' => true,
#    'foo' => false,
#}
#if $foo['foobar'] {
#    notify{'foobar':}
#}
#if $foo['foo'] {
#    notify{'foo':}
#}
#if $foo['bar'] {
#    notify{'bar':}
#$loc = 'ab1'
#$arr = ['foo-ab1', 'bar-ab1', 'foo-ab1bar', 'bar-ab1$', 'foo-xz1', 'bar-xz1']
#$new_arr = $arr.filter |$items| { $items !~ "-${loc}$" }
#notify {$new_arr:}
#
#}
file {'/tmp/kjhasdkjh':
    ensure => directory
}
