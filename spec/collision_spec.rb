require 'matrix'
require 'collision'


FakeUnit = Struct.new :position

def unit x, y
  FakeUnit.new Vector[x, y]
end

describe :collision do
  it 'should return nil if distance is too big' do
    expect(collision(unit(-1, 0), unit(1, 0), 1)).to be nil
  end

  it 'should return zero if the distance is below the threshold' do
    expect(collision(unit(-1, 0), unit(1, 0), 3)).to be 0
  end
end
