# Common parameters for the shiftleader module
class shiftleader::params (
  String                     $api_name,
  String                     $database_password,
  String                     $database_server,
  String                     $fernet_key,
  String                     $puppetcaserver,
  String                     $puppetserver,
  String                     $web_name,

  String                     $admin_group = 'Administrators',
  Variant[String, Boolean]   $api_cert = false,
  Variant[String, Boolean]   $api_key = false,
  String                     $database_bane = 'shiftleader2',
  String                     $database_user = 'shiftleader2',
  Enum['running', 'stopped'] $service_ensure = 'running',
  Boolean                    $service_enable = true,
  Variant[String, Boolean]   $web_cert = false,
  Variant[String, Boolean]   $web_key = false,
){
  if($api_cert) {
    $api_url = "https://${api_name}"
  } else {
    $api_url = "http://${api_name}"
  }

  if($web_cert) {
    $web_url = "https://${web_name}"
  } else {
    $web_url = "http://${web_name}"
  }
}
