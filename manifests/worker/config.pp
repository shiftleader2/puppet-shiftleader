# Configures the generic shiftleader2-worker settings. 
class shiftleader::worker::config (
  String                     $api_url       = $shiftleader::params::api_url,
) inherits shiftleader::params {
  $sl2_username = lookup('shiftleader::worker::username', String)
  $sl2_password = lookup('shiftleader::worker::password', String)

  include ::shiftleader::apt
  include ::shiftleader::deps
  
  package { 'shiftleader2-worker-common':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }

  ini_setting { 'Shiftleader2-worker-api':
    ensure  => 'present',
    path    => '/etc/shiftleader2/workers.ini',
    section => 'api',
    setting => 'location',
    value   => $api_url,
    tag     => 'shiftleader-config',
  }

  ini_setting { 'Shiftleader2-worker-username':
    ensure  => 'present',
    path    => '/etc/shiftleader2/workers.ini',
    section => 'api',
    setting => 'username',
    value   => $sl2_username,
    tag     => 'shiftleader-config',
  }

  ini_setting { 'Shiftleader2-worker-password':
    ensure  => 'present',
    path    => '/etc/shiftleader2/workers.ini',
    section => 'api',
    setting => 'password',
    value   => $sl2_password,
    tag     => 'shiftleader-config',
  }
}
