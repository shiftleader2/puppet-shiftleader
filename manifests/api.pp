# Installs and configures the shiftleader2 API 
class shiftleader::api (
  String                     $api_name       = $shiftleader::params::api_name,
  Variant[String, Boolean]   $api_cert       = $shiftleader::params::api_cert,
  Variant[String, Boolean]   $api_key        = $shiftleader::params::api_key,
  String                     $puppetapi_name = $shiftleader::params::puppetapi_name,
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
    cert => $api_cert, 
    key  => $api_key,
  }

  ::shiftleader::api::vhost { $puppetapi_name:
    cert => "/etc/puppetlabs/puppet/ssl/certs/${::fqdn}.pem", 
    key  => "/etc/puppetlabs/puppet/ssl/private_keys/${::fqdn}.pem",
  }
}
