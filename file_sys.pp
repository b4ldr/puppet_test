file {'/sys/block/sda/queue/read_ahead_kb':
    ensure  => file,
    content => '1',
    backup  => false,
}
