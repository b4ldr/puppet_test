$meta = {
    'country'             => 'US',
    'locality'            => 'San Francisco',
    'organisation'        => 'technolagy',
    'organisational_unit' => 'PKI',
    'state'               => 'California',
}
class {'cfssl::initca':
    ca_name   => 'ca.example.org CA',
    ca_config => {
        'key'   => {'algo' =>'rsa', 'size' => 2048},
        'names' => [$meta],
    }
}
cfssl::csr {'www.example.org':
    key   => {'algo' =>'rsa', 'size' => 2048},
    names => [$meta],
    hosts => ['example.org', '192.0.2.1'],
}

yaml
cfssl::initca::ca_name: 'Wikimedia CFSSL CA'
cfssl::initca::ca_config:
  key:
    algo: rsa
    size: 2048
  names:
    country: 'US'
    locality: 'San Francisco'
    organisation: 'technolagy'
    organisational_unit: 'PKI'
    state: CA
