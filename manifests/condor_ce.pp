class htcondorce::condor_ce{
  package { "condor":
    ensure => present,
  }
  package { "blahp":
    ensure => present,
  }
  package { "htcondor-ce":
    ensure => present,
  }
  package { "htcondor-ce-client":
    ensure => present
  }
  package { "htcondor-ce-pbs":
    ensure => present
  }
  package { "lcmaps-plugins-voms":
    ensure => present
  }
  package { "lcmaps-plugins-verify-proxy":
    ensure => present
  }
  service {"condor-ce":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
    require  => Package["htcondor-ce"]
  }
  file { 'blah.config':
    path    => '/etc/blah.config',
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/blah.config',
    selinux_ignore_defaults => true,
    require => Package["blahp"],
  }

  file { 'pbs_local_submit_attributes.sh':
    path    => '/etc/blahp/pbs_local_submit_attributes.sh',
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/blahp/pbs_local_submit_attributes.sh',
    require => Package["blahp"],
  }

  file { 'condor_mapfile':
    ensure  => present,
    path    => '/etc/condor-ce/condor_mapfile',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/condor-ce/condor_mapfile',
    notify  => Service['condor-ce'],
  }

  file { 'condor-ce-hcc-config':
    ensure  => present,
    path    => '/etc/condor-ce/config.d/09-hcc-tuning.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/condor-ce/config.d/09-hcc-tuning.conf',
    notify  => Service['condor-ce'],
  }
}
