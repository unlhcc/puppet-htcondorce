class htcondorce::condor_ce{
  package { "htcondor-ce":
    ensure => present
  }
  service {"condor-ce":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
    requie  => Package["htcondor-ce"]
  }
  file { 'blah.config':
    path    => '/etc/blah.config',
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/blah.config',
  }

  file { 'condor-ce-01-ce-auth':
    ensure  => present,
    path    => '/etc/condor-ce/config.d/01-ce-auth.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/htcondorce/condor-ce/config.d/01-ce-auth.conf',
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
