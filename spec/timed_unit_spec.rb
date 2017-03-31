require 'timed_unit'


describe TimedUnit do
  let(:unit) { TimedUnit.new 8.0, Vector[2, 3] }

  it 'should store the position' do
    expect(unit.position).to eq Vector[2, 3]
  end

  it 'should store the direction' do
    expect(TimedUnit.new(8.0, Vector[2, 3], Vector[0, 0], Math::PI).direction).to eq Math::PI
  end

  it 'should use zero as default direction' do
    expect(unit.direction).to eq 0
  end

  describe :update do
    it 'should return an array with the object itself' do
      expect(unit.update(0.25, double('joystick'))).to eq [unit]
    end

    it 'should return an empty array when the object life time has expired' do
      expect(unit.update(8.0, double('joystick'))).to eq []
    end
  end

  describe :relative_age do
    it 'should return zero initially' do
      expect(unit.relative_age).to eq 0
    end

    it 'should increase when the time is updated' do
      unit.update 1, double('joystick')
      expect(unit.relative_age).to eq 0.125
    end
  end
end
