# Installs and configures the puppetCA-related workers for ShiftLeader2
class shiftleader::worker::puppet::ca (
  Enum['running', 'stopped'] $service_ensure = $shiftleader::params::service_ensure,
  Boolean                    $service_enable = $shiftleader::params::service_enable,
) inherits shiftleader::params {
  include ::shiftleader::apt
  include ::shiftleader::deps
  include ::shiftleader::worker::config
  include ::shiftleader::worker::puppet

  service { 'shiftleader2-puppet-certmanager':
    ensure => $service_ensure,
    enable => $service_enable,
    tag    => 'shiftleader-service',
  }
}
