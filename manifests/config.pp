class htcondorce::config {

  exec { 'osg-configure':
    command => '/usr/sbin/osg-configure --configure',
    refreshonly => true,
  }

  exec { 'condor_ce_reconfig':
    command => '/bin/condor_ce_reconfig',
    refreshonly => true,
  }

  #################### /etc/condor-ce #################################
  #file { '/etc/condor-ce/config.d/99-local.conf':
  #  ensure => present,
  #  owner  => 'root',
  #  group  => 'root',
  #  mode   => '0644',
  #  source => 'puppet:///modules/htcondorce/condor-ce/config.d/99-local.conf ',
  #  notify => Service['condor-ce'],
  #}

  #file { '/etc/condor-ce/mapfiles.d/99-local.conf':
  #  ensure => present,
  #  owner  => 'root',
  #  group  => 'root',
  #  mode   => '0644',
  #  source => 'puppet:///modules/htcondorce/condor-ce/mapfiles.d/99-local.conf ',
  #  notify => Service['condor-ce'],
  #}

  file { '/etc/condor-ce/condor_mapfile':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/htcondorce/condor_mapfile',
    notify  => Exec['condor_ce_reconfig'],
  }

  file { '/etc/sysconfig/condor-ce':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/osg_ce_condor/sysconfig-condor-ce',
  }

  #################### /etc/condor #################################
  file { '/etc/condor/config.d/99-local.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/htcondorce/condor/config.d/99-local.conf ',
    notify  => Exec['condor_ce_reconfig'],
  }

  #################### /etc/osg/config.d/ #############################
  file { "/etc/osg/config.d/01-squid.ini":
    ensure  => present,
    owner   => "root", group => "root", mode => '0644',
    content => template("${module_name}/osg/config.d/01-squid.ini.erb"),
    notify  => Exec['osg-configure'],
  }

  file { "/etc/osg/config.d/10-storage.ini":
    ensure  => present,
    owner   => "root", group => "root", mode => '0644',
    content => template("${module_name}/osg/config.d/10-storage.ini.erb"),
    notify  => Exec['osg-configure'],
  }

  file { "/etc/osg/config.d/20-slurm.ini":
    ensure  => present,
    owner   => "root", group => "root", mode => '0644',
    content => template("${module_name}/osg/config.d/20-slurm.ini.erb"),
    notify  => Exec['osg-configure'],
  }

  file { "/etc/osg/config.d/40-siteinfo.ini":
    ensure  => present,
    owner   => "root", group => "root", mode => '0644',
    content => template("${module_name}/osg/config.d/40-siteinfo.ini.erb"),
    notify  => Exec['osg-configure'],
  }

  file { '/etc/osg/config.d/10-gateway.ini':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/htcondorce/osg/config.d/10-gateway.ini',
    notify => Exec['osg-configure'],
  }

  file { '/etc/osg/config.d/30-gip.ini':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/htcondorce/osg/config.d/30-gip.ini',
    notify => Exec['osg-configure'],
  }

  file { '/etc/osg/config.d/30-gratia.ini':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/htcondorce/osg/config.d/30-gratia.ini',
    notify => Exec['osg-configure'],
  }

  file { '/etc/osg/config.d/30-infoservices.ini':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/htcondorce/osg/config.d/30-infoservices.ini',
    notify => Exec['osg-configure'],
  }

  file { '/etc/osg/config.d/35-pilot.ini':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/htcondorce/osg/config.d/35-pilot.ini',
    notify => Exec['osg-configure'],
  }

  file { '/etc/osg/config.d/40-localserttings.ini':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/htcondorce/osg/config.d/40-localsettings.ini',
    notify => Exec['osg-configure'],
  }

  #################### /etc/gratia/ #############################
  file { "/etc/gratia/htcondor-ce/ProbeConfig":
    ensure  => present,
    owner   => "root", group => "root", mode => '0644',
    content => template("${module_name}/gratia/htcondor-ce/ProbeConfig"),
    notify  => Service['gratia-probes-cron'],
  }

}
