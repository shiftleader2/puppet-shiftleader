# Installs and configures the dhcp-worker for ShiftLeader2
class shiftleader::worker::dhcp (
  Enum['running', 'stopped'] $service_ensure = $shiftleader::params::service_ensure, 
  Boolean                    $service_enable = $shiftleader::params::service_enable,
) inherits shiftleader::params {
  $serverset = lookup('shiftleader::worker::dhcp::serverset', String)

  include ::shiftleader::apt
  include ::shiftleader::deps
  include ::shiftleader::worker::config
  
  package { 'shiftleader2-worker-dhcp':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }

  service { 'shiftleader2-dhcp-worker':
    ensure => $service_ensure,
    enable => $service_enable,
    tag    => 'shiftleader-service',
  }

  ini_setting { 'Shiftleader2-worker-dhcp-serverset':
    ensure  => 'present',
    path    => '/etc/shiftleader2/workers.ini',
    section => 'dhcp',
    setting => 'serverset',
    value   => $serverset,
    tag     => 'shiftleader-config',
  }
}
