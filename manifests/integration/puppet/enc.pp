# Configures the puppetmaster to use the ShiftLeader2 ENC.
class shiftleader::integration::puppet::enc {
  include ::shiftleader::worker::puppet

  puppet::config::server {
    'node_terminus':  value => 'exec';
    'external_nodes': value => '/usr/local/bin/shiftleader2-puppet-enc';
  }
}
