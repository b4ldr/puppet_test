$servers_by_datacenter = {
    'eqiad' => {'shard01' => {'host' => '192.0.2.1', 'port' => '90'}},
    'eqiad-gutter' => {'shard01' => {'host' => '192.0.2.1', 'port' => '90'}},
    'codfw' => {'shard01' => {'host' => '192.0.2.1', 'port' => '90'}},
    'codfw-gutter' => {'shard01' => {'host' => '192.0.2.1', 'port' => '90'}},
}
$site = 'eqiad'
#$routes = union([
#    {
#        'aliases' => [ "/${::site}/mw/" ],
#        'route' => {
#            'type' => 'FailoverRoute',
#            'children' => [ "PoolRoute|${::site}", "PoolRoute|${::site}-gutter"],
#            'failover_errors' => [ 'tko' ]
#        }
#    }],
$routes =  union(  $servers_by_datacenter.map |$region, $servers| {
        if $region !~ /^\w+-gutter$/ {
            # gutters do not have routes
            if ( $region == $::site ) {
                {
                    'aliases' => [ "/${::site}/mw-wan/" ],
                    'route' => {
                        'type' => 'OperationSelectorRoute',
                        'default_policy' => {
                            'type' => 'FailoverRoute',
                            'children' => [ "PoolRoute|${::site}", "PoolRoute|${::site}gutter" ],
                            'failover_errors' => [ 'tko' ]
                        },
                        'operation_policies' => {
                            'delete' => {
                                'type' => 'AllSyncRoute',
                                'children' => [ "PoolRoute|${::site}", "PoolRoute|${::site}-gutter" ]
                            }
                        }
                    }
                }
            } else {
                {
                    'aliases' => [ "/${region}/mw-wan/"],
                    'route' => {
                        'type' => 'OperationSelectorRoute',
                        'default_policy' => {
                            'type' => 'FailoverRoute',
                            'children' => [ "PoolRoute|${::site}", "PoolRoute|${::site}-gutter" ],
                            'failover_errors' => [ 'tko' ]
                        },
                        'operation_policies' => {
                            'delete' => {
                                'type' => 'AllSyncRoute',
                                'children' => [ "AllSyncRoute|Pool|${region}", "AllSyncRoute|Pool|${region}-gutter" ]
                            },
                            'set' => {
                                'type' => 'FailoverRoute',
                                'children' => [ "PoolRoute|${region}", "PoolRoute|${region}-gutter" ],
                                'failover_errors' => [ 'tko' ]
                            }
                        }
                    }
                }
            }
        } else { [] }
    }, []).delete_undef_values
$content = inline_template("
<%- require 'json' -%>
<%= JSON.pretty_generate(@routes) %>
")
notice($routes)
notice($content)
