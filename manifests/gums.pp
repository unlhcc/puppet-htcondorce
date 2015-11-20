class htcondorce::gums{
  package {"gums-client":
    ensure  => present,
  }

  service {"gums-client-cron":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
    require  => Package["gums-client"],
  }
}
