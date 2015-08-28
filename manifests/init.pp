
class htcondorce (
  $squid = $htcondorce::params::squid,
  $backend_scheduler = $htcondorce::params::backend_scheduler,
  ) inherits htcondorce::params {
    
    if $backend_scheduler =~ /^slurm$/ {
        package { "gratia-probe-slurm": ensure => present }
        package { "osg-configure-slurm" : ensure => present }
        $backend_scheduler = "pbs"
    }

    validate_re($backend_scheduler, [ '^pbs$', '^condor$', '^lsf$', '^sge$' ], "Error, backend_scheduler must be either pbs, condor, lsf, or sge.  Is actually ${backend_scheduler}")
    
    package { "osg-ce-${backend_scheduler}": 
      ensure => present
    }

    
    

}
