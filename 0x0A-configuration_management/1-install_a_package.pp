# Install flask from pip3

exec { 'puppet-lint':
  command => '/usr/bin/apt-get -y install puppet-lint -v 2.1.0',
}
