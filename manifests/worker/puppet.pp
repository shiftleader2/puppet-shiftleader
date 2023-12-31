# Installs and configures the puppet-related workers for ShiftLeader2
class shiftleader::worker::puppet (
  Enum['running', 'stopped'] $service_ensure = $shiftleader::params::service_ensure, 
  Boolean                    $service_enable = $shiftleader::params::service_enable,
) inherits shiftleader::params {
  include ::shiftleader::apt
  include ::shiftleader::deps
  include ::shiftleader::worker::config
  
  package { 'shiftleader2-worker-puppet':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }

  service { [
   'shiftleader2-puppet-r10k-downloader',
   'shiftleader2-puppet-r10k-envupdate',
  ]:
    ensure => $service_ensure,
    enable => $service_enable,
    tag    => 'shiftleader-service',
  }
}
