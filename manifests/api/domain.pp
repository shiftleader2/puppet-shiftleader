# Configures shiftleader to use a domain 
define shiftleader::api::domain (
  $server,
  $bind_user,
  $bind_pass,
  $group_base,
  $group_member_attribute,
  $user_base,
  $user_id_attribute,
) {
  include ::shiftleader::deps

  $common = {
    'ensure' => 'present',
    'path'   => '/etc/shiftleader2/settings.ini',
    'tag'    => 'shiftleader-config',
  }

  ini_setting {
    "sl2api-${name}-server":
      section => "LDAP-${name}",
      setting => 'server',
      value   => $server,
      *       => $common;
    "sl2api-${name}-user":
      section => "LDAP-${name}",
      setting => 'bind_user',
      value   => $bind_user,
      *       => $common;
    "sl2api-${name}-pass":
      section => "LDAP-${name}",
      setting => 'bind_pass',
      value   => $bind_pass,
      *       => $common;
    "sl2api-${name}-gbase":
      section => "LDAP-${name}",
      setting => 'group_base',
      value   => $group_base,
      *       => $common;
    "sl2api-${name}-member":
      section => "LDAP-${name}",
      setting => 'group_member_attribute',
      value   => $group_member_attribute,
      *       => $common;
    "sl2api-${name}-user-base":
      section => "LDAP-${name}",
      setting => 'user_base',
      value   => $user_base,
      *       => $common;
    "sl2api-${name}-userid":
      section => "LDAP-${name}",
      setting => 'user_id_attribute',
      value   => $user_id_attribute,
      *       => $common;
  }
}
