# Increases the amount of traffic that can be handled on an Nginx server

exec { 'Limit':
  command => '/usr/bin/env sed -i s/15/2000/ /etc/default/nginx',
}
exec { '/usr/bin/env service nginx restart': }
