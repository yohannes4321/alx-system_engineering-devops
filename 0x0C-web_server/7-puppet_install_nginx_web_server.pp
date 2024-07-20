# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx to redirect HTTP requests to a specific URL
file_line { 'redirect_to_github':
  ensure  => present,
  path    => '/etc/nginx/sites-enabled/default',
  after   => 'listen 80 default_server;',
  line    => 'rewrite ^ /redirect_me https://github.com/yohannes4321 permanent;',
}

# Ensure the index.html file is present
file { 'index_html':
  path    => '/var/www/html/index.html',
  content => 'Hello World!',
}

# Ensure Nginx service is running
service { 'nginx':
  ensure => running,
  require => Package['nginx'],
}
