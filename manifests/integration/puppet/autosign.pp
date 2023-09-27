# Configures the puppetmaster to use the ShiftLeader2 to verify if a cert should
# be signed or not.
class shiftleader::integration::puppet::autosign {
  include ::shiftleader::worker::puppet

  ini_setting { 'Shiftleader2-puppetenc-enc':
    ensure  => 'present',
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'autosign',
    value   => '/usr/local/bin/shiftleader2-puppet-autosign',
    require => Anchor['shiftleader::config::begin'],
    notify  => Service['puppetserver'],
  }
}
