# Defines anchors to aid in the ordering when installing shiftleader.
class shiftleader::deps {
  anchor {'shiftleader::install::begin' : }
  -> Package<| tag == 'shiftleader-package' |>
  ~> anchor { 'shiftleader::install::end': }
  -> anchor { 'shiftleader::config::begin': }
  -> Ini_setting<| tag == 'shiftleader-config' |>
  ~> anchor { 'shiftleader::service::begin': }
  ~> Service<| tag == 'shiftleader-service' |>
  ~> anchor { 'shiftleader::service::end': }
}
