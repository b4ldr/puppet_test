type My::Foo = Enum['foo', 'bar']

type Profile::Mariadb::Role = Enum['master','slave','stadalone']
$foo = Profile::Mariadb::Role
$bar = Enum($foo).map |$foo| { $foo }
notice($bar)
