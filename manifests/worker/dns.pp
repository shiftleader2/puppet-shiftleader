# Installs and configures the dns-worker for ShiftLeader2
class shiftleader::worker::dns (
  Enum['running', 'stopped'] $service_ensure = $shiftleader::params::service_ensure, 
  Boolean                    $service_enable = $shiftleader::params::service_enable,
) inherits shiftleader::params {
  include ::shiftleader::apt
  include ::shiftleader::deps
  include ::shiftleader::worker::config
  
  package { 'shiftleader2-worker-dns':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }

  service { 'shiftleader2-dns-worker':
    ensure => $service_ensure,
    enable => $service_enable,
    tag    => 'shiftleader-service',
  }
}
