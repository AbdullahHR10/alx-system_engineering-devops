# Installs flask from pip3 using Puppet
package { 'python3.8':
  ensure   => '3.8.10',
  provider => 'pip3',
}
package { 'flash':
  ensure   => '2.1.0',
  provider => 'pip3',
}
