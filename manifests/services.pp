class htcondorce::services () {
  service {"condor-ce":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
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
  service {"osg-info-services":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
  }
  service {"gums-client-cron":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
  }
  service {"gratia-probes-cron":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
  }
  service {"nfs":
    ensure  => running,
    enable  => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
