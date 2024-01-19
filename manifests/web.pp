# Installs and configures the shiftleader2 Web-interface 
class shiftleader::web (
  Optional[String]           $access_log_format = undef,
  Enum['running', 'stopped'] $service_ensure    = $shiftleader::params::service_ensure,
  Boolean                    $service_enable    = $shiftleader::params::service_enable,
  String                     $web_name          = $shiftleader::params::web_name,
  Variant[String, Boolean]   $web_cert          = $shiftleader::params::web_cert,
  Variant[String, Boolean]   $web_key           = $shiftleader::params::web_key,
) inherits shiftleader::params {
  include ::shiftleader::apt
  include ::shiftleader::deps
  include ::shiftleader::web::config

  package { 'shiftleader2-web':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }

  ::shiftleader::web::vhost { $web_name:
    access_log_format => $access_log_format,
    cert              => $web_cert,
    key               => $web_key,
  }
}
