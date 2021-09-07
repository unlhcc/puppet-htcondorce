class htcondorce::services {

  service { 'condor-ce':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Package['htcondor-ce'],
  }

  service { 'gratia-probes-cron':
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
    require  => Package['gratia-probe-htcondor-ce'],
  }

}
