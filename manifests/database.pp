# Creates an MySQL database for shiftleader 
class shiftleader::database (
  String $host     = $shiftleader::params::database_allowed_hosts,
  String $database = $shiftleader::params::database_name, 
  String $username = $shiftleader::params::database_username,
  String $password = $shiftleader::params::database_password,
) inherits shiftleader::params {
  include ::shiftleader::deps

  mysql::db { $database:
    user     => $username,
    password => $password,
    charset  => 'utf8mb3',
    collate  => 'utf8mb3_general_ci'
    host     => $host,
    grant    => ['CREATE', 'ALTER',
                  'DELETE', 'INSERT',
                  'SELECT', 'UPDATE',
                  'INDEX', 'DROP',
                  'REFERENCES',
                ],
  }
}

