# Common parameters for the shiftleader module
class shiftleader::params (
  String                     $api_name,
  String                     $fernet_key,
  String                     $web_name,

  String                     $admin_group = 'Administrators',
  Variant[String, Boolean]   $api_cert = false,
  Variant[String, Boolean]   $api_key = false,
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
