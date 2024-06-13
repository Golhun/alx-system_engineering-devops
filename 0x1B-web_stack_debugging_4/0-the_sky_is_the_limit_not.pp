# This Puppet manifest modifies the ULIMIT for Nginx and restarts the service to apply changes.

exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => ['/usr/local/bin/', '/bin/'],
  onlyif  => 'grep -q "ULIMIT" /etc/default/nginx',
  require => File['/etc/default/nginx'],
} ->

exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => ['/etc/init.d/'],
  subscribe => Exec['fix--for-nginx'],
}

file { '/etc/default/nginx':
  ensure => present,
}
