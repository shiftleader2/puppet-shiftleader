# Configures the puppetmaster to use the ShiftLeader2 to verify if a cert should
# be signed or not.
class shiftleader::integration::puppet::autosign {
  include ::shiftleader::worker::puppet

  puppet::config::server {
    'autosign':  value => '/usr/local/bin/shiftleader2-puppet-autosign';
  }
}
