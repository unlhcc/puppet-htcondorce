class htcondorce::sharedfs {
  file {"/var/lib/condor-ce":
    ensure  => directory,
    owner   => "condor",
    group   => "condor",
    mode    => "0777",
  }
  file {"/etc/exports":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    source  => "puppet:///modules/htcondorce/exports",
    notify  => Service["nfs"],
  } 
}
