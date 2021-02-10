$addresses = $facts['networking']['interfaces'].values().reduce([]) |$memo, $int| {
    $memo + [$int['ip'], $int['ip6']]
}.delete_undef_values() + ['localhost', $facts['fqdn']]
notice($addresses )
