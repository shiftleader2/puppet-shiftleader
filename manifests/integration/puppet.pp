# Configures the integrations needed for puppet <-> ShiftLeader2
class shiftleader::integration::puppet {
  include ::shiftleader::integration::puppet::autosign
  include ::shiftleader::integration::puppet::enc
}
