# Installs and configures the puppet-related workers for ShiftLeader2
class shiftleader::worker::puppet (
  Enum['running', 'stopped'] $service_ensure = 'running',
  Boolean                    $service_enable = true,
){
  $sl2_api = lookup('shiftleader::api', Stdlib::HTTPUrl)
  $sl2_username = lookup('shiftleader::worker::username', String)
  $sl2_password = lookup('shiftleader::worker::password', String)

  require ::shiftleader::apt
  include ::shiftleader::deps
  
  package { 'shiftleader2-worker-puppet':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }

  service { [
   'shiftleader2-puppet-r10k-downloader',
   'shiftleader2-puppet-r10k-envupdate',
  ]:
    ensure => $service_ensure,
    enable => $service_enable,
    tag    => 'shiftleader-service',
  }

  ini_setting { 'Shiftleader2-worker-api':
    ensure  => 'present',
    path    => '/etc/shiftleader2/workers.ini',
    section => 'api',
    setting => 'location',
    value   => $sl2_api,
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
