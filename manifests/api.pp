# Installs and configures the shiftleader2 API 
class shiftleader::api (
  String                     $api_name       = $shiftleader::params::api_name,
  Variant[String, Boolean]   $api_cert       = $shiftleader::params::api_cert,
  Variant[String, Boolean]   $api_key        = $shiftleader::params::api_key,
  Integer                    $processes      = $::facts['processors']['count'],
  String                     $puppetapi_name = $shiftleader::params::puppetapi_name,
  Variant[String, Boolean]   $puppetapi_cert = "/etc/puppetlabs/puppet/ssl/certs/${::fqdn}.pem",
  Variant[String, Boolean]   $puppetapi_key  = "/etc/puppetlabs/puppet/ssl/private_keys/${::fqdn}.pem", 
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
  
  ::shiftleader::api::vhost { $api_name:
    cert      => $api_cert, 
    key       => $api_key,
    processes => $processes,
  }

  ::shiftleader::api::vhost { $puppetapi_name:
    cert      => $puppetapi_cert,
    key       => $puppetapi_key,
    processes => $processes,
  }
}
