# Installs and configures the shiftleader2 API 
class shiftleader::api (
  String                     $api_name = $shiftleader::params::api_name,
  Enum['running', 'stopped'] $service_ensure = $shiftleader::params::service_ensure, 
  Boolean                    $service_enable = $shiftleader::params::service_enable,
) inherits shiftleader::params {
  include ::shiftleader::apt
  include ::shiftleader::deps
  include ::shiftleader::api::config
  
  package { 'shiftleader2-api':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }
  
  ::shiftleader::api::vhost { $api_name: }
}
