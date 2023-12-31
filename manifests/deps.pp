# Defines anchors to aid in the ordering when installing shiftleader.
class shiftleader::deps {
  anchor { 'shiftleader::repo::begin': }
  -> Apt::Source<| tag == 'shiftleader-repo' |>
  -> anchor {'shiftleader::install::begin' : }
  -> Package<| tag == 'shiftleader-package' |>
  ~> anchor { 'shiftleader::install::end': }
  -> anchor { 'shiftleader::config::begin': }
  -> Apache::Vhost<| tag == 'shiftleader-vhost' |>
  -> Ini_setting<| tag == 'shiftleader-config' |>
  -> Mysql::Db<| tag == 'shiftleader-db' |>
  ~> anchor { 'shiftleader::service::begin': }
  ~> Service<| tag == 'shiftleader-service' |>
  ~> anchor { 'shiftleader::service::end': }

  # Make config-changes in shiftleader restart the webserver as well.
  Anchor['shiftleader::service::begin']
  ~> Service<| name == 'apache2' |>
}
