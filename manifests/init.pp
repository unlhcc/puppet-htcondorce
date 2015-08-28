
class htcondorce (
  $squid = $htcondorce::params::squid,
  $backend_scheduler = $htcondorce::params::backend_scheduler,
  ) inherits htcondorce::params {
    
    validate_re($backend_scheduler, [ '^pbs$', '^condor$', '^lsf$', '^sge$' ], "Error, backend_scheduler must be either pbs, condor, lsf, or sge")
    
    package { "htcondor-ce-${backend_scheduler}": ensure => present }

}
