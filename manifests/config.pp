class htcondorce::config {

  file { 'ProbeConfig':
    ensure  => file,
    path    => '/etc/gratia/slurm/ProbeConfig',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/ProbeConfig.erb'),
#    require => Package['gratia-probe-slurm'],
  }

  file { '01-squid.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/01-squid.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/osg/config.d/01-squid.ini.erb'),
  }

  file { '10-gateway.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/10-gateway.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/osg/config.d/10-gateway.ini',
  }

  file { '10-misc.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/10-misc.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/osg/config.d/10-misc.ini.erb'),
  }

  file { '10-storage.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/10-storage.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content  => template('htcondorce/osg/config.d/10-gateway.ini.erb'),
  }

  file { '20-pbs.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/20-pbs.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/osg/config.d/20-pbs.ini.erb'),
  }

  file { '30-gip.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/30-gip.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/osg/config.d/30-gip.ini',
  }

  file { '30-infoservices.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/30-infoservices.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/osg/config.d/30-infoservices.ini',
  }

  file { 'user-vo-map':
    ensure  => file,
    path    => '/var/lib/osg/user-vo-map',
  }

  exec {"gums-host-cron":
    path        => "/usr/bin",
    command     => "gums-host-cron",
    subscribe   => File["/var/lib/osg/user-vo-map"],
    refreshonly => true,
    logoutput   => "on_failure",
  }

  file { '40-siteinfo.ini':
    ensure  => file,
    path    => '/etc/osg/config.d/40-siteinfo.ini',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/osg/config.d/40-siteinfo.ini.erb'),
  }

  file { 'osg-job-environment.conf':
    ensure  => file,
    path    => '/var/lib/osg/osg-job-environment.conf',
  }

  exec {"osg-configure":
    path        => "/usr/sbin",
    command     => "osg-configure -c",
    subscribe   => File["/var/lib/osg/osg-job-environment.conf"],
    refreshonly  => true,
    onlyif      => "osg-configure -v",
    logoutput   => "on_failure",
  }

  # Also in osg_ce
  #file { '/etc/gums/gums-client.properties':
  #  ensure  => present,
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0644',
  #  content => template('osg_ce_condor/gums-client.properties.erb'),
  #}

  file { 'blah.config':
    path    => '/etc/blah.config',
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/blah.config',
  }

  #file { 'condor-ce':
#    path    => '/etc/condor-ce'
#    ensure  => directory,
#    recurse => true,
#    purge   => true,
#    force   => true,
#    owner   => 'root',
#    group   => 'root',
#    mode    => '0644',
#    source  => 'puppet:///modules/htcondorce/condor-ce',
#    notify  => Service['condor-ce']
#  }

  #file { 'condor-ce-rms-config':
  #  ensure  => present,
  #  name    => '/etc/condor-ce/config.d/02-ce-rms.conf',
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0644',
  #  source  => $osg_ce_condor::rms_config,
  #  notify  => Service['condor-ce'],
  #}

  file { 'condor-ce-hcc-config':
    ensure  => present,
    path    => '/etc/condor-ce/config.d/09-hcc-tuning.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/condor-ce/config.d/09-hcc-tuning.conf',
    notify  => Service['condor-ce'],
  }

  #file { '/etc/condor-ce/condor_mapfile':
  #  ensure  => present,
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0644',
  #  source  => 'puppet:///modules/osg_ce_condor/condor_mapfile',
  #  notify  => Service['condor-ce'],
  #}

  #file { '/etc/condor-ce/gsi-authz.conf':
  #  ensure  => present,
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0644',
  #  source  => 'puppet:///modules/osg_ce_condor/gsi-authz.conf',
  #}

  #file { '/etc/sysconfig/condor-ce':
  #  ensure  => present,
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0644',
  #  source  => 'puppet:///modules/osg_ce_condor/sysconfig-condor-ce',
  #}

  #file { '/etc/blahp/pbs_local_submit_attributes.sh':
  #  ensure  => present,
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0644',
  #  source  => 'puppet:///modules/htcondorce/pbs_local_submit_attributes.sh',
  #}

  #file { '/usr/libexec/blahp/pbs_local_submit_attributes.sh':
  #  ensure  => link,
  #  target  => '/etc/blahp/pbs_local_submit_attributes.sh',
  #}

}
