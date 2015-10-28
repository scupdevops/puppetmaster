class base::puppet {
	file { "/etc/puppet":
        ensure => directory,
        recurse => true,
	purge   => true,
	force   => true,
	owner => "root",
        group => "root",
        mode => 0644,
        source => "puppet:///modules/base/etc/puppet",
      }

	file { '/etc/cron.d/puppet':
        ensure => present,
        mode   => '0644',
        source => 'puppet:///modules/base/etc/cron.d/puppet.cron',
   }
}
