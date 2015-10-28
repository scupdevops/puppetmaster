class newww::nginx {

   file { '/etc/logrotate.d/app-scup':
      ensure => file,
      source => 'puppet:///modules/newww/nginx/logrotate-app-scup',
   }

   file { '/etc/nginx/conf.d/newww.conf':
      ensure => present,
      owner => root,
      group => root,
      recurse => true,
      require => Package["nginx"],
      notify  => Service["nginx"],
      source => 'puppet:///modules/newww/nginx/newww.conf',
   }

   file { '/var/log/nginx/app-scup.com':
      ensure => directory,
      owner => root,
      group => root,
      recurse => true,
   }
}
