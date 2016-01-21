class htcondorce::gratia (
  $slurm_db_password = '',
) {
  package { "gratia-probe-common":
    ensure => present
  }

  file { 'ProbeConfig':
    ensure  => file,
    path    => '/etc/gratia/slurm/ProbeConfig',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondorce/gratia/slurm/ProbeConfig.erb'),
    require => Package['gratia-probe-slurm'],
  }

  file { 'pwfile':
    ensure  => file,
    path    => '/etc/gratia/slurm/pwfile',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('htcondorce/gratia/slurm/pwfile.erb'),
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
