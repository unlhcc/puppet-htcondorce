
class htcondorce (
  $squid = $slurm::params::squid,
  $backend_scheduler = $slurm::params::backend_scheduler
  ) inherits slurm::params {
    
    package { "htcondor-ce-${::backend_scheduler}": ensure => present }

}
