# This Puppet manifest increases the hard and soft file limits for the holberton user.

exec { 'increase-hard-file-limit-for-holberton-user':
  command => 'sed -i "/holberton hard/s/5/50000/" /etc/security/limits.conf',
  path    => ['/usr/local/bin/', '/bin/'],
  onlyif  => 'grep -q "holberton" /etc/security/limits.conf',
  require => File['/etc/security/limits.conf'],
}

exec { 'increase-soft-file-limit-for-holberton-user':
  command => 'sed -i "/holberton soft/s/4/50000/" /etc/security/limits.conf',
  path    => ['/usr/local/bin/', '/bin/'],
  onlyif  => 'grep -q "holberton" /etc/security/limits.conf',
  require => File['/etc/security/limits.conf'],
}

file { '/etc/security/limits.conf':
  ensure => present,
}
