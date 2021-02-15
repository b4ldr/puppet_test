$_groups = defined('$groups') ? {
  true    => $groups,
  default => undef,
}
user {'jbond': groups => $_groups }
