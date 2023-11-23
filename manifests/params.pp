# Common parameters for the shiftleader module
class shiftleader::params (
  String                     $api_name,
  String                     $database_password,
  String                     $database_server,
  String                     $fernet_key,
  String                     $puppetapi_name,
  String                     $puppetcaserver,
  String                     $puppetserver,
  String                     $web_name,

  String                     $admin_group = 'Administrators',
  Variant[String, Boolean]   $api_cert = false,
  Variant[String, Boolean]   $api_key = false,
  String                     $database_allowed_hosts = '127.0.0.1',
  String                     $database_name = 'shiftleader2',
  String                     $database_username = 'shiftleader2',
  Boolean                    $external_tls = false,
  Enum['running', 'stopped'] $service_ensure = 'running',
  Boolean                    $service_enable = true,
  Variant[String, Boolean]   $web_cert = false,
  Variant[String, Boolean]   $web_key = false,
){
  if($api_cert or $external_tls) {
    $api_url = "https://${api_name}"
  } else {
    $api_url = "http://${api_name}"
  }

  if($web_cert or $external_tls) {
    $web_url = "https://${web_name}"
  } else {
    $web_url = "http://${web_name}"
  }
}
