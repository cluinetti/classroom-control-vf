define users::managed_user (
  $shell = '/bin/bash',
  $home = "/home/${title}",
  $group = $title,
  $ssh_authkey = undef,
  $ssh_authkey_type = 'ssh-rsa',
) {
  $user = $title
  File {
    owner => $user,
}
  user { $user:
   ensure => present,
   shell => $shell,
}
 file { "$home/${title}":
  ensure => directory,
  owner => $title,
  group => $group,
  mode => '0750',
}
file { "${home}/.ssh":
  ensure => directory,
  mode => '0700',
  }
}
