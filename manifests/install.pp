class htcondorce::install {

  package { 'htcondor-ce': ensure  => present, }
  package { 'htcondor-ce-client': ensure  => present, }

  package { 'osg-configure': ensure => present, }
  package { 'osg-ce': ensure => present, }
  package { 'vo-client': ensure => latest, }
  package { 'voms': ensure => latest, }
  package { 'osg-ca-certs': => latest, }

  # Install HTCondor-CE Gratia probe
  package { 'gratia-probe-htcondor-ce': ensure => present, }

}
