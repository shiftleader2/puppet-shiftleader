# Configures an apache2 virtual-host for the Shiftleader API 
define shiftleader::api::vhost (
  Variant[String, Boolean] $cert = false,
  Variant[String, Boolean] $key = false,
){
  include ::shiftleader::deps

  if($cert) {
    $tls_options = {
      'port'     => 443,
      'ssl'      => true,
      'ssl_cert' => $cert, 
      'ssl_key'  => $key, 
    }
  } else {
    $tls_options = {
      'port' => 80,
    }
  }

  apache::vhost { "ShiftLeader2-API-${name}":
    docroot                     => "/var/lib/shiftleader2",
    servername                  => $name,
    tag                         => 'shiftleader-vhost',
    wsgi_application_group      => '%{GLOBAL}',
    wsgi_daemon_process         => 'sl2',
    wsgi_daemon_process_options => {
      processes => 1,
      threads   => 4, 
      user      => 'sl2',
      group     => 'www-data',
    },
    wsgi_pass_authorization     => 'on',
    wsgi_process_group          => 'sl2',
    wsgi_script_aliases         => { 
      '/' => '/var/lib/shiftleader2/shiftleader2.wsgi', 
    },
    *                           => $tls_options,
  }
}
