
class htcondorce (
  $backend_scheduler = $htcondorce::params::backend_scheduler,
  $gip_queue_exclude = $htcondorce::params::gip_queue_exclude,
  ) inherits htcondorce::params {

    include htcondorce::osg,
            htcondorce::condor_ce,
            htcondorce::hostcert,
            htcondorce::sharedfs,
            htcondorce::gratia,
            htcondorce::gums,
            htcondorce::fetch_crl


    if $backend_scheduler == 'pbs' or $backend_scheduler == 'lsf' {
        package { 'gratia-probe-pbs-lsf': ensure => present }
    } else {
        package { "gratia-probe-${backend_scheduler}": ensure => present }
    }

    validate_re($backend_scheduler, [ '^pbs$', '^condor$', '^lsf$', '^sge$', '^slurm$' ], "Error, backend_scheduler must be either pbs, condor, lsf, sge, or slurm.  Is actually ${backend_scheduler}")

    package { "osg-ce-${backend_scheduler}": ensure => present }

    if $backend_scheduler == 'slurm' {
        package { 'slurm-torque': ensure => present }
    }

}
