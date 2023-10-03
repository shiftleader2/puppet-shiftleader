# Configures the shiftleader API 
define shiftleader::api::config (
  $admin_group    = $shiftleader::params::admin_group,
  $api_url        = $shiftleader::params::api_url,
  $fernet_key     = $shiftleader::params::fernet_key,
  $puppetcaserver = $shiftleader::params::puppetcaserver, 
  $puppetserver   = $shiftleader::params::puppetserver,
  $web_url        = $shiftleader::params::web_url,
) inherits shiftleader::params {
  include ::shiftleader::deps

  $common = {
    'ensure' => 'present',
    'path'   => '/etc/shiftleader2/settings.ini',
    'tag'    => 'shiftleader-config',
  }

  ini_setting {
    'sl2api-loglevel': { 'section' => 'DEFAULT', 'setting' => 'loglevel', 
      value => 'info', * => $common },
    'sl2api-api': { 'section' => 'url', 'setting' => 'api', 
      value => $api_url, * => $common },
    'sl2api-puppetserver': { 'section' => 'url', 'setting' => 'puppetserver', 
      value => $puppetserver, * => $common },
    'sl2api-puppetcaserver': { 'section' => 'url', 'setting' => 'puppetcaserver',
      value => $puppetcaserver, * => $common },
    'sl2api-fernet': { 'section' => 'auth', 'setting' => 'fernet-key', 
      value => $fernet_key, * => $common },
    'sl2api-admingroup': { 'section' => 'auth', 'setting' => 'admin_group', 
      value => $admin_group, * => $common },
    'sl2api-admingroup': { 'section' => 'cors', 'setting' => 'origin', 
      value => $web_url, * => $common },
  }
}
