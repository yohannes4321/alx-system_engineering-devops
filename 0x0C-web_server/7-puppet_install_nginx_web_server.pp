# Automating project requirements using Puppet

package { 'nginx':
  ensure => installed,
}

file { '/etc/nginx/sites-enabled/default':
  ensure  => file,
  content => '
    server {
      listen 80 default_server;
      rewrite ^/redirect_me https://www.github.com/besthor permanent;
    }
  ',
  notify  => Service['nginx'],
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

