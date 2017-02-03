class ntp::config {
  file { $::ntp::ntp_conf:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    content => template('ntp/ntp.conf.erb'),
    notify  => CLass['ntp::service'],
  }
}