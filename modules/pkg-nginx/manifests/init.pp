class pkg-nginx {

$nginx = [ "nginx", "openssl" ]
package { $nginx: ensure => "installed" }

   service { 'nginx':
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
      require => Package['nginx'],
   }

   file { '/etc/logrotate.d/nginx':
      ensure => file,
      source => 'puppet:///modules/pkg-nginx/logrotate-nginx',
   }

   file { '/etc/nginx/':
      ensure => directory,
      owner => root,
      group => root,
      recurse => true,
      purge => true,
      force => true,
   }

   file { '/etc/nginx/conf.d':
      ensure => directory,
      owner => root,
      group => root,
      recurse => true,
      purge => true,
      force => true,
   }

   file { '/etc/nginx/nginx.conf':
      ensure => present,
      owner => root,
      group => root,
      recurse => true,
      require => Package["nginx"],
      notify  => Service["nginx"],
      source => 'puppet:///modules/pkg-nginx/conf/nginx.conf',
   }

   file { '/etc/nginx/mime.types':
      ensure => present,
      owner => root,
      group => root,
      recurse => true,
      require => Package["nginx"],
      notify  => Service["nginx"],
      source => 'puppet:///modules/pkg-nginx/conf/mime.types',
   }

   file { '/var/log/nginx':
      ensure => directory,
      owner => root,
      group => root,
      recurse => true,
   }
}
