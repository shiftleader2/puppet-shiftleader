# Configures the dhcp-worker for ShiftLeader2
class shiftleader::worker::config::dhcp {
  $serverset = lookup('shiftleader::worker::dhcp::serverset', String)

  include ::shiftleader::deps
  include ::shiftleader::worker::config
  
  ini_setting { 'Shiftleader2-worker-dhcp-serverset':
    ensure  => 'present',
    path    => '/etc/shiftleader2/workers.ini',
    section => 'dhcp',
    setting => 'serverset',
    value   => $serverset,
    tag     => 'shiftleader-config',
  }
}
