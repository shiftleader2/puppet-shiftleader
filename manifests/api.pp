# Installs and configures the shiftleader2 API 
class shiftleader::api (
  String                     $api_name,
  Enum['running', 'stopped'] $service_ensure = 'running',
  Boolean                    $service_enable = true,
){
  include ::shiftleader::apt
  include ::shiftleader::deps
  
  package { 'shiftleader2-api':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }
  
  ::shiftleader::api::vhost { $api_name: }
}
