#Configures the puppetmaster to use the ShiftLeader2 ENC.
class shiftleader::integration::puppetenc {
  include ::shiftleader::worker::puppet

  ini_setting { 'Shiftleader2-puppetenc-terminus':
    ensure  => 'present',
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'node_terminus',
    value   => 'exec',
    require => Anchor['shiftleader::config::begin'],
    notify  => Service['puppetserver'],
  }

  ini_setting { 'Shiftleader2-puppetenc-enc':
    ensure  => 'present',
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'external_nodes',
    value   => '/usr/local/bin/shiftleader2-puppet-enc',
    require => Anchor['shiftleader::config::begin'],
    notify  => Service['puppetserver'],
  }
}
