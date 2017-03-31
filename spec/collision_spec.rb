require 'matrix'
require 'collision'


describe :collision do
  it 'should return nil if distance is too big' do
    expect(collision(Vector[-1, 0], Vector[1, 0], 1)).to be nil
  end

  it 'should return zero if the distance is below the threshold' do
    expect(collision(Vector[-1, 0], Vector[1, 0], 3)).to be 0
  end
end
