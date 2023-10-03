# Creates an MySQL database for shiftleader 
class shiftleader::database (
  String $database = 'shiftleader2',
  String $username = 'shiftleader2',
  String $password,
  String $host     = '127.0.0.1',
) {
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

