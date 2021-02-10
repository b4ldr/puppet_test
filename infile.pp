class resolv {
    case $hostname {
        /^[Abc]/: {
            resolv::resolv_config { 'Default':
                domain => "mydomain.local",
            }
        }
    }
}

define resolv::resolv_config($domain){
    file { '/tmp/resolv.conf':
        content => $domain
    }
}
include resolv
