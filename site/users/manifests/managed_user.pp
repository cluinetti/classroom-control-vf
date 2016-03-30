define users::managed_user (
  $user $title,
  $shell = '/bin/bash',
  $home = "/home/${title}",
) {
  user { $user:
    ensure => present,
    shell => $shell,
 }
 file { $home:
  ensure => directory, 
  owner => $user, 
  mode => '0750',
}
file { "${home}/.ssh":
  ensure => directory, 
  owner => $user,
  mode => '0700',
}
file { "${home}/.vimrc":
  ensure => directory, 
  owner => $user,
  replace => false,
}
if $ssh_authkey {
  ssh_authorized_key { "${user} default key":
}
}
