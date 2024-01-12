# Configures the shiftleader Web-interface
class shiftleader::web::config (
  String                         $api_url = $shiftleader::params::api_url,
  Optional[Hash[String, String]] $domains = undef,
) inherits shiftleader::params {
  include ::shiftleader::deps

  ini_setting { 'sl2web-api':
    ensure  => present,
    path    => '/var/www/shiftleader/settings.js',
    setting => 'api',
    value   => "\"${api_url}\"",
    tag     => 'shiftleader-config',
  }

  if($domains) {
    $parts = $domains.map | $dname, $identifier | {
      "'${dname}': ${identifier},"
    }
    $allparts = ['{'] + $parts  + ['}']
    ini_setting { 'sl2web-domains':
      ensure  => present,
      path    => '/var/www/shiftleader/settings.js',
      setting => 'domains',
      value   => join($allparts, ' '),
      tag     => 'shiftleader-config',
    }
  }
}
