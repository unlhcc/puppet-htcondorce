class htcondorce::gums{
  package {"gums-client":
    ensure  => present,
  }

  #exec {"gums-host-cron":
  #  path        => "/bin:/usr/bin:/sbin:/usr/sbin",
  #  command     => "gums-host-cron",
  #  logoutput   => "on_failure",
  #  notify  => Exec['osg-configure'],
  #}
  service {"gums-client-cron":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
    require  => Package["gums-client"],
  }
}
