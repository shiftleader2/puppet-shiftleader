# Installs the shiftleader2 client 
class shiftleader::client {
  include ::shiftleader::apt
  include ::shiftleader::deps

  package { 'shiftleader2-client':
    ensure => 'present',
    tag    => 'shiftleader-package',
  }
}
