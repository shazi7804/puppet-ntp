class ntp::params {
  $package_manage  = true
  $package_name    = 'ntp'
  $package_ensure  = 'present'
  $service_enable  = true
  $service_name    = 'ntp'
  $service_ensure  = 'running'
  $server          = [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ]
  $data_dir        = '/var/lib/ntp'
  $ntp_conf        = '/etc/ntp.conf'
  

  case $::osfamily {
    'Debian': {
      $driftfile      = "$data_dir/ntp.drift"
    }
    'Redhat': {
      $driftfile      = "$data_dir/drift"
    }
  }
}
