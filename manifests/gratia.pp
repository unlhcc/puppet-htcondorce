class htcondorce::gratia () {
  package { "gratia-probe-common":
    ensure => present
  }

  service {"gratia-probes-cron":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
    requie  => Package["gratia-probe-common"],
  }
}
