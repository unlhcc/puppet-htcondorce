class htcondorce::install (
) {
    file {"RPM-GPG-KEY-OSG":
      ensure      => present,
      path        => "/etc/pki/rpm-gpg/RPM-GPG-KEY-OSG",
    }
    exec {"update osg":
      path        => "/bin:/usr/bin:/sbin:/usr/sbin",
      command     => "yum update",
      subscribe   => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-OSG"],
      refreshonly => true,
      logoutput   => "on_failure",
    }
}
