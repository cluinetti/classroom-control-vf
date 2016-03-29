class users {
  user { 'fundamentals':
    ensure => present,
    shell => '/sbin/nolgin',
    }
}
