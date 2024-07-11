# Installs Nginx on web-01
node 'web-01' {
  
  # Ensure the package lists are up to date and install Nginx
  exec { 'update_package_list':
    command => '/usr/bin/apt-get update -y -qq',
    path    => ['/usr/bin', '/usr/sbin'],
  }

  package { 'nginx':
    ensure  => installed,
    require => Exec['update_package_list'],
  }

  # Allow Nginx on the firewall
  exec { 'allow_nginx_firewall':
    command => '/usr/sbin/ufw allow \'Nginx HTTP\'',
    path    => ['/usr/bin', '/usr/sbin'],
  }

  # Give the user ownership of website files for easy editing
  file { '/var/www/html':
    ensure  => directory,
    owner   => $::user,
    group   => $::user,
    mode    => '0755',
    recurse => true,
    require => Package['nginx'],
  }

  # Backup default index.html
  file { '/var/www/html/index.nginx-debian.html.bckp':
    ensure => file,
    source => '/var/www/html/index.nginx-debian.html',
    require => Package['nginx'],
  }

  # Create index.html that contains "Hello World!"
  file { '/var/www/html/index.html':
    ensure  => file,
    content => 'Hello World!',
    mode    => '0644',
    require => Package['nginx'],
  }

  # Ensure Nginx service is running
  service { 'nginx':
    ensure     => running,
    enable     => true,
    subscribe  => File['/var/www/html/index.html'],
  }

}
