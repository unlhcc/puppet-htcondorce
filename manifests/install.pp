class htcondorce::install (
) {
    exec {"update osg":
      path        => "/bin:/usr/bin:/sbin:/usr/sbin",
      command     => "yum update",
      subscribe   => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-OSG"],
      refreshonly => "TRUE",
      logoutput   => "on_failure",
    }
}
