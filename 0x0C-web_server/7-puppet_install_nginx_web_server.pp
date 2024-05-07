# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Create Hello World index page
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# Configure Nginx to perform 301 redirect for /redirect_me
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('nginx_redirect/default.erb'),
  require => Package['nginx'],
}

# Enable default site by creating symbolic link
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => File['/etc/nginx/sites-enabled/default'],
}
