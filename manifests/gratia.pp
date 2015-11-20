class htcondorce::gratia () {
  package { "gratia-probe-common":
    ensure => present
  }
  package { "gratia-probe-slurm":
    ensure => present
  }

  file { 'ProbeConfig':
    ensure  => file,
    path    => '/etc/gratia/slurm/ProbeConfig',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/ProbeConfig.erb'),
    require => Package['gratia-probe-slurm'],
  }
  
  service {"gratia-probes-cron":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
    require  => Package["gratia-probe-common"],
  }
}
