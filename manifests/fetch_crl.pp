class htcondorce::fetch_crl{
  package { "fetch-crl":
    ensure => present
  }
  service {"fetch-crl-cron":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package["fetch-crl"],
  }
}
