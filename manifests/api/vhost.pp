# Configures an apache2 virtual-host for the Shiftleader API 
define shiftleader::api::vhost (
  Boolean $tls          = false,
  String $tls_cert_path = '',
  String $tls_key_path = '',
){
  include ::shiftleader::deps

  if($tls) {
    $tls_options = {
      'port'     => 443,
      'ssl'      => true,
      'ssl_cert' => $tls_cert_path, 
      'ssl_key'  => $tls_key_path, 
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

  # Make config-changes in shiftleader restart the webserver as well.
  Anchor['shiftleader::service::begin']
  ~> Service<| name == 'httpd' |>
  
}
