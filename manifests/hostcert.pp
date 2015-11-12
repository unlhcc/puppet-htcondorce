class htcondorce::hostcert {
  file { "/etc/grid-security":
    ensure => directory,
    owner  => "root",
    group => "root",
    mode => 0755,
  }
  file { "hostcert.pem":
		path    => "/etc/grid-security/hostcert.pem",
    ensure  => present,
		owner   => "puppet",
    group => "root",
    mode => "0644",
    show_diff => false,
		source  => "puppet://hostcert/${hostname}-hostcert.pem",
	}
  file { "hostkey.pem":
		path    => "/etc/grid-security/hostkey.pem",
    ensure  => present,
		owner   => "puppet",
    group => "root",
    mode => "0600",
    show_diff => false,
		source  => "puppet://hostcert/${hostname}-hostkey.pem",
	}

}
