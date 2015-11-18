
class htcondorce (
  $squid = $htcondorce::params::squid_server,
  $backend_scheduler = $htcondorce::params::backend_scheduler,
  ) inherits htcondorce::params {

    include htcondorce::install,
            htcondorce::osg,
            htcondorce::condor_ce,
            htcondorce::hostcert,
            htcondorce::sharedfs,
            htcondorce::gratia,
            htcondorce::gums,
            htcondorce::fetch_crl,
            cvmfs


    if $backend_scheduler =~ /^slurm$/ {
        package { "gratia-probe-slurm": ensure => present }
        package { "osg-configure-slurm" : ensure => present }
        $real_backend_scheduler = "pbs"
    } else {
        $real_backend_scheduler = $backend_scheduler
    }

    validate_re($real_backend_scheduler, [ '^pbs$', '^condor$', '^lsf$', '^sge$' ], "Error, backend_scheduler must be either pbs, condor, lsf, or sge.  Is actually ${real_backend_scheduler}")

    package { "osg-ce-${real_backend_scheduler}":
      ensure => present
    }

    package { "slurm-torque": ensure => present }



}
