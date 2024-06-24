# Makes changes to a configuration file using Puppet
class ssh_config {
  
  file { '/home/ubuntu/.ssh/config':
    ensure  => file,
    owner   => 'ubuntu',
    group   => 'ubuntu',
    mode    => '0600',
    content => template('ssh/config.erb'),
  }

}
