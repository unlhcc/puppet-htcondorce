class htcondorce::osg{
  file { '01-squid.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/01-squid.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/osg/config.d/01-squid.ini.erb'),
    notify  => Exec['osg-configure'],
  }

  file { '10-gateway.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/10-gateway.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/osg/config.d/10-gateway.ini',
    notify  => Exec['osg-configure'],
  }

  file { '10-misc.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/10-misc.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/osg/config.d/10-misc.ini.erb'),
    notify  => Exec['osg-configure'],
  }

  file { '10-storage.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/10-storage.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content  => template('htcondorce/osg/config.d/10-storage.ini.erb'),
    notify  => Exec['osg-configure'],
  }

  file { '20-pbs.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/20-pbs.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/osg/config.d/20-pbs.ini.erb'),
    notify  => Exec['osg-configure'],
  }

  file { '30-gip.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/30-gip.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/osg/config.d/30-gip.ini',
    notify  => Exec['osg-configure'],
  }

  file { '30-infoservices.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/30-infoservices.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/osg/config.d/30-infoservices.ini',
    notify  => Exec['osg-configure'],
  }

  file { '40-siteinfo.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/40-siteinfo.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/osg/config.d/40-siteinfo.ini.erb'),
    notify  => Exec['osg-configure'],
  }

  exec {"osg-configure":
      path        => "/bin:/usr/bin:/sbin:/usr/sbin",
      command     => "osg-configure -c",
      notify      => Service["condor-ce"],
      logoutput   => "on_failure",
  }


}
