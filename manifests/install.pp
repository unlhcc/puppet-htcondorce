class htcondorce::install (
) {
    file {"RPM-GPG-KEY-OSG":
      ensure      => present,
    }
    exec {"update osg":
      path        => "/bin:/usr/bin:/sbin:/usr/sbin",
      command     => "yum update",
      subscribe   => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-OSG"],
      refreshonly => "TRUE",
      logoutput   => "on_failure",
    }
}
