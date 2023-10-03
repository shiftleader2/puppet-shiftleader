# Creates an MySQL database for shiftleader 
class shiftleader::database (
  String $database = $shiftleader::params::database_name, 
  String $username = $shiftleader::params::database_username,
  String $password = $shiftleader::params::database_password,
  String $host     = '127.0.0.1',
) inherits shiftleader::params {
  include ::shiftleader::deps

  mysql::db { $database:
    user     => $username,
    password => $password,
    host     => $host,
    grant    => ['CREATE', 'ALTER',
                  'DELETE', 'INSERT',
                  'SELECT', 'UPDATE',
                  'INDEX', 'DROP',
                  'REFERENCES',
                ],
  }
}

