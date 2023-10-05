# Configures the shiftleader Web-interface
class shiftleader::web::config (
  $api_url           = $shiftleader::params::api_url,
) inherits shiftleader::params {
  include ::shiftleader::deps

  ini_setting { 'sl2web-api':
    ensure  => present,
    path    => '/var/www/shiftleader/settings.js'
    setting => 'api',
    value   => "\"${api_url}\"",
    tag     => 'shiftleader-config',
  }
}
