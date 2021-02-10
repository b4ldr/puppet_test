$os_id = {
  'winS11' => {
    'dist' => 'Windows',
    'type' => 'Server',
    'rlse' => '19',
  },
  'nixS21' => {
    'dist' => 'Solaris',
    'type' => 'Server',
    'rlse' => '11.4',
  },
  'nixS31' => {
    'dist' => 'CentOS',
    'type' => 'Server',
    'rlse' => '8',
  }
}

$os_code = $os_id.reduce({}) |$result, $values| {
  if $values[1]['dist'] == 'CentOS' {
    $result + {'name' => $values[0]} + $values[1]
  } else {
    $result
  }
}

notice("$os_code")

