# Configures the shiftleader API
class shiftleader::api::config (
  $admin_group       = $shiftleader::params::admin_group,
  $api_url           = $shiftleader::params::api_url,
  $database_server   = $shiftleader::params::database_server,
  $database_name     = $shiftleader::params::database_name,
  $database_username = $shiftleader::params::database_username,
  $database_password = $shiftleader::params::database_password,
  $fernet_key        = $shiftleader::params::fernet_key,
  $keep_logs         = 10,
  $puppetcaserver    = $shiftleader::params::puppetcaserver,
  $puppetserver      = $shiftleader::params::puppetserver,
  $web_url           = $shiftleader::params::web_url,
) inherits shiftleader::params {
  include ::shiftleader::deps

  $common = {
    'ensure' => 'present',
    'path'   => '/etc/shiftleader2/settings.ini',
    'tag'    => 'shiftleader-config',
  }
  $db_connection = "mysql+pymysql://${database_username}:${database_password}@${database_server}/${database_name}"

  ini_setting {
    'sl2api-loglevel':
      section => 'DEFAULT',
      setting => 'loglevel',
      value   => 'info',
      *       => $common;
    'sl2api-api':
      section => 'url',
      setting => 'api',
      value   => $api_url,
      *       => $common;
    'sl2api-puppetserver':
      section => 'url',
      setting => 'puppetserver',
      value   => $puppetserver,
      *       => $common;
    'sl2api-puppetcaserver':
      section => 'url',
      setting => 'puppetcaserver',
      value   => $puppetcaserver,
      *       => $common;
    'sl2api-fernet':
      section => 'auth',
      setting => 'fernet-key',
      value   => $fernet_key,
      *       => $common;
    'sl2api-admingroup':
      section => 'auth',
      setting => 'admin_group',
      value   => $admin_group,
      *       => $common;
    'sl2api-cors':
      section => 'cors',
      setting => 'origin',
      value   => $web_url,
      *       => $common;
    'sl2api-db':
      section   => 'database',
      setting   => 'uri',
      show_diff => false,
      value     => $db_connection,
      *         => $common;
    'sl2api-puppet-keeplogs':
      section   => 'puppet',
      setting   => 'keep_logs',
      value     => $keep_logs,
      *         => $common;
  }
}
