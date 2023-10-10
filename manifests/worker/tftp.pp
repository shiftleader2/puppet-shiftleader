# Installs and configures the tftp-worker for ShiftLeader2
class shiftleader::worker::tftp (
  Enum['running', 'stopped'] $service_ensure = $shiftleader::params::service_ensure, 
  Boolean                    $service_enable = $shiftleader::params::service_enable,
) inherits shiftleader::params {
  $tftproot = lookup('shiftleader::worker::tftp::root', {
    'default_value' => '/var/lib/tftpboot/',
    'value_type'    => Stdlib::Unixpath,
  })

  include ::shiftleader::apt
  include ::shiftleader::deps
  include ::shiftleader::worker::config
  include ::shiftleader::worker::config::dhcp
  
  package { 'shiftleader2-worker-tftp':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }

  service { 'shiftleader2-tftp-worker':
    ensure => $service_ensure,
    enable => $service_enable,
    tag    => 'shiftleader-service',
  }

  ini_setting { 'Shiftleader2-worker-tftp-root':
    ensure  => 'present',
    path    => '/etc/shiftleader2/workers.ini',
    section => 'tftp',
    setting => 'root',
    value   => $tftproot,
    tag     => 'shiftleader-config',
  }
}
