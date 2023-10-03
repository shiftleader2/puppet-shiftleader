# Installs and configures the shiftleader2 API 
class shiftleader::api (
  Enum['running', 'stopped'] $service_ensure = 'running',
  Boolean                    $service_enable = true,
){
  require ::shiftleader::apt
  include ::shiftleader::deps
  
  package { 'shiftleader2-api':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }
  
  ::shiftleader::api::vhost { 'api.shiftleader.rothaugane.com':
  }
}
