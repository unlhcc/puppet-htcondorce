class htcondorce::gratia () {
  package { "gratia-probe-common":
    ensure => present
  }

  service {"gratia-probes-cron":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
    require  => Package["gratia-probe-common"],
  }
}
