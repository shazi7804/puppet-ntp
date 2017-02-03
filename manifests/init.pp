class ntp (
  $package_manage = $::ntp::params::package_manage,
  $package_name   = $::ntp::params::package_name,
  $package_ensure = $::ntp::params::package_ensure,
  $service_enable = $::ntp::params::service_enable,
  $service_name   = $::ntp::params::service_name,
  $service_ensure = $::ntp::params::service_ensure,
  $server         = $::ntp::params::server,
  $data_dir       = $::ntp::params::data_dir,
  $driftfile      = $::ntp::params::driftfile,
  $ntp_conf       = $::ntp::params::ntp_conf,
  ) inherits ntp::params {

  $array_servers = is_array($ntp::server) ? {
    false      => $ntp::server ? {
      ''       => [],
      default  => split($::ntp::server, ','),
    },
    default    => $::ntp::server,
  }

  include ntp::install
  include ntp::config
  include ntp::service

  Class['::ntp::install'] ->
  Class['::ntp::config'] ~>
  Class['::ntp::service']
}