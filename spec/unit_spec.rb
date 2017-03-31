require 'matrix'
require 'unit'


describe Unit do
  it 'should store the position' do
    expect(Unit.new(Vector[2, 3]).position).to eq Vector[2, 3]
  end

  it 'should store the direction' do
    expect(Unit.new(Vector[2, 3], Math::PI).direction).to eq Math::PI
  end

  it 'should use zero as default direction' do
    expect(Unit.new(Vector[2, 3]).direction).to eq 0
  end

  describe :update do
    it 'should return an array with the object itself' do
      unit = Unit.new Vector[2, 3]
      expect(unit.update(0.25, double('joystick'))).to eq [unit]
    end
  end
end
