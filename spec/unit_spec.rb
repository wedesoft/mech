require 'matrix'
require 'unit'


describe Unit do
  let(:unit) { Unit.new Vector[2, 3] }
  it 'should store the position' do
    expect(unit.position).to eq Vector[2, 3]
  end

  it 'should store the direction' do
    expect(Unit.new(Vector[2, 3], Vector[0, 0], Math::PI).direction).to eq Math::PI
  end

  it 'should use zero as default direction' do
    expect(unit.direction).to eq 0
  end

  it 'should have a zero speed by default' do
    expect(unit.speed).to eq Vector[0, 0]
  end

  describe :update do
    it 'should return an array with the object itself' do
      expect(unit.update(0.25, double('joystick'))).to eq [unit]
    end
  end

  context 'when moving' do
    let(:unit) { Unit.new Vector[2, 3], Vector[1, 2], 0 }

    it 'should change position when updating the time' do
      unit.update 1, double('joystick')
      expect(unit.position).to eq Vector[3, 5]
    end

    it 'should change position according to the time change' do
      unit.update 2, double('joystick')
      expect(unit.position).to eq Vector[4, 7]
    end
  end
end
