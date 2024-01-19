# Configures an apache2 virtual-host for the Shiftleader WEB-interface 
define shiftleader::web::vhost (
  Optional[String]         $access_log_format = undef,
  Variant[String, Boolean] $cert = false,
  Variant[String, Boolean] $key = false,
){
  include ::shiftleader::deps

  if($cert) {
    $vhost_name = "ShiftLeader2-WEB-${name}-TLS"
    $tls_options = {
      'port'     => 443,
      'ssl'      => true,
      'ssl_cert' => $cert,
      'ssl_key'  => $key,
    }

    apache::vhost { "ShiftLeader2-WEB-${name}":
      servername      => $name,
      port            => 80,
      docroot         => '/var/www/shiftleader',
      add_listen      => false,
      redirect_source => ['/'],
      redirect_dest   => ["https://${$name}"],
      redirect_status => ['permanent'],
    }
  } else {
    $vhost_name = "ShiftLeader2-WEB-${name}"
    $tls_options = {
      'port' => 80,
    }
  }

  apache::vhost { $vhost_name:
    add_listen        => false,
    docroot           => '/var/www/shiftleader',
    servername        => $name,
    tag               => 'shiftleader-vhost',
    access_log_format => $access_log_format,
    *                 => $tls_options,
  }
}
