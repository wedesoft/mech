require 'matrix'
require 'collision'


FakeUnit = Struct.new :position, :speed

def unit x, y, vx=0, vy=0
  FakeUnit.new Vector[x, y], Vector[vx, vy]
end

describe :collision do
  it 'should return nil if distance is too big' do
    expect(collision(unit(-1, 0), unit(1, 0), 1)).to be nil
  end

  it 'should return zero if the distance is below the threshold' do
    expect(collision(unit(-1, 0), unit(1, 0), 3)).to eq 0
  end

  it 'should determine the time to collision when moving' do
    expect(collision(unit(-1, 0, 1, 0), unit(1, 0), 1)).to eq 1
  end

  it 'should take into account the target position' do
    expect(collision(unit(-1, 0, 1, 0), unit(2, 0), 1)).to eq 2
  end

  it 'should return nil if the unit is moving away from the target' do
    expect(collision(unit(-1, 0, -1, 0), unit(1, 0), 1)).to be nil
  end

  it 'should determine the time to collision if the target is moving' do
    expect(collision(unit(-1, 0), unit(1, 0, -1, 0), 1)).to eq 1
  end

  it 'should return nil if the target is moving away from the unit' do
    expect(collision(unit(-1, 0), unit(1, 0, 1, 0), 1)).to be nil
  end

  it 'should take into account the speed of the unit' do
    expect(collision(unit(-1, 0, 2, 0), unit(2, 0), 1)).to eq 1
  end

  it 'should determine the time to collision even when it is not a frontal collision' do
    expect(collision(unit(-6, 4, 1, 0), unit(0, 0), 5)).to be_within(1e-6).of 3
  end

  it 'should return nil if the objects are going to pass each other' do
    expect(collision(unit(-5, 2, 1, 0), unit(5, -2, -1, 0), 3)).to be nil
  end
end
