define foo::notice (
    Enum['present', 'absent'] $ensure = 'present',
    String                    $msg    = '',
) {
    notify{$title: message => $msg}
    notice("${title}: ${msg}")
}
class foo (
    # how can i reuse the definition of foo::notice for the type constraint below and avoid having to write something like
    # Hash[String, Struct[{ensure => Optional[Enum['present', 'absent']], msg => String}]] $notices = {}
    #
    # The following are things i have tried but don't work
    # Hash[String, Foo::Notice] $notices = {} -- Error: parameter 'notices' entry 'test' expects a Resource value, got Struct
    # Hash[Foo::Notice] $notices = {} -- Error: Hash-Type[] accepts 2 to 4 arguments. Got 1
    # Foo::Notice $notices = {} -- Error: parameter 'notices' expects a Resource value, got Struct
    #
    # This is normally what i end up doing
    Hash[String, Hash] $notices = {}
) {
    $notices.each |$notice_title, $params| {
        foo::notice {$notice_title:
            * => $params
        }
    }
}
class{'foo':
    notices => {
        'test'        => {'msg' => 'foobar'},
        'test_absent' => {'ensure' => 'absent', 'msg' => 'foobar'},
    }
}
