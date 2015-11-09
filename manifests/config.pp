class htcondorce::config {
  #$require = class["htcondorce::install"]
#file { 'osg':
#  path    => '/etc/osg',
#  ensure  => directory,
#  recurse => true,
#  purge   => true,
#  force   => true,
#  owner   => 'root',
#  group   => 'root',
#  mode    => '0644',
#  source  => 'puppet:///modules/htcondorce/osg',
#}
  file { 'ProbeConfig':
    ensure  => file,
    path    => '/etc/gratia/slurm/ProbeConfig',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/ProbeConfig.erb'),
    require => Package['gratia-probe-slurm'],
  }

file { '10-gateway.ini':
  ensure  => file,
  path    => '/etc/osg/config.d/10-gateway.ini',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  source  => 'puppet:///modules/htcondorce/osg/config.d/10-gateway.ini',
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
    source  => 'puppet:///modules/htcondorce/condor-ce/condig.d/09-hcc-tuning.conf',
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

  file { '/etc/sysconfig/condor-ce':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/osg_ce_condor/sysconfig-condor-ce',
  }

  file { '/etc/blahp/pbs_local_submit_attributes.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/pbs_local_submit_attributes.sh',
  }

  file { '/usr/libexec/blahp/pbs_local_submit_attributes.sh':
    ensure  => link,
    target  => '/etc/blahp/pbs_local_submit_attributes.sh',
  }

}
