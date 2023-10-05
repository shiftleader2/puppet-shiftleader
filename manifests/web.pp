# Installs and configures the shiftleader2 Web-interface 
class shiftleader::web (
  Enum['running', 'stopped'] $service_ensure = $shiftleader::params::service_ensure, 
  Boolean                    $service_enable = $shiftleader::params::service_enable,
  String                     $web_name       = $shiftleader::params::web_name,
  Variant[String, Boolean]   $web_cert       = $shiftleader::params::web_cert,
  Variant[String, Boolean]   $web_key        = $shiftleader::params::web_key,
) inherits shiftleader::params {
  include ::shiftleader::apt
  include ::shiftleader::deps
  include ::shiftleader::web::config
  
  package { 'shiftleader2-web':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }
  
  ::shiftleader::web::vhost { $api_name:
    cert => $api_cert, 
    key  => $api_key,
  }
}
