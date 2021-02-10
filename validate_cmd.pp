file {'/etc/apache2/sites-available/example.org':
    ensure       => file,
    content      => 'foo',
    validate_cmd => '/usr/local/bin/validate_httpd.sh %'
}
