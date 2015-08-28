
class htcondorce (
  $squid = $slurm::params::user,
  ) inherits slurm::params {

    package { 'htcondor-ce': ensure => present }

}
