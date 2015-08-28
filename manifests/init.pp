
class htcondorce (
  $squid = $slurm::params::squid,
  $backend_scheduler = $slurm::params::backend_scheduler
  ) inherits slurm::params {
    notice( "Backend scheduler set to ${backend_scheduler}" )
    validate_re($backend_scheduler, [ '^pbs$', '^condor$', '^lsf$', '^sge$' ], "Error, backend_scheduler must be either pbs, condor, lsf, or sge")
    
    package { "htcondor-ce-${backend_scheduler}": ensure => present }

}
