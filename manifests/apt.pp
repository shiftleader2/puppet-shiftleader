# Configures the ShiftLeader2 repositories.
class shiftleader::apt (
    Enum['present','absent'] $ensure
) {
  include ::apt
  include ::shiftleader::deps

  $distrib = downcase($::operatingsystem)

  $release = $::lsbdistcodename ? {
    'focal' => 'jammy',
    default  => $::lsbdistcodename,
  }

  apt::source { 'ShiftLeader2':
    ensure   => $ensure,
    location => "https://repo.it.ntnu.no/shiftleader2",
    release  => $release,
    repos    => 'main',
    key      => {
      'id'    => '72C3A8E3E830504BA71A8AAE733E24CF0D6F268E',
      'source' => 'https://repo.it.ntnu.no/shiftleader2/shiftleader2.gpg.key'
    },
    before   => Anchor['shiftleader::install::begin'],
  }
}

