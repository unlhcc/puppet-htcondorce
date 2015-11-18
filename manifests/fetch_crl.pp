class htcondorce::fetch_crl{
  tidy {"CyGrid":
    path    => "/etc/grid-security/certificates",
    matches => [ "CyGrid*"],
  }
  package { "fetch-crl":
    ensure => present
  }
  service {"fetch-crl-boot":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
  }
  service {"fetch-crl-cron":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
