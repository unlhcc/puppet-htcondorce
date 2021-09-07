
class htcondorce (
  $squid_server = $htcondorce::params::squid_server,
  $slurm_head_node = $htcondorce::params::slurm_head_node,
  $cluster_name = $htcondorce::params::cluster_name,
  $resource_name = $htcondorce::params::resource_name,
  $resource_group = $htcondorce::params::resource_group,
  $sponsor = $htcondorce::params::sponsor,
  $contact = $htcondorce::params::contact,
  $app_dir = $htcondorce::params::app_dir,
  $worker_node_temp = $htcondorce::params::worker_node_temp,
  $gip_queue_exclude = $htcondorce::params::gip_queue_exclude,
  ) inherits htcondorce::params {

    include htcondorce::install
    include  htcondorce::config
    include  htcondorce::services
}
