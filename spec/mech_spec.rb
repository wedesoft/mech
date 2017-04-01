require 'mech'


describe Mech do
  let(:mech) { Mech.new Vector[2, 3] }

  it 'should use the initial position' do
    expect(mech.position).to eq Vector[2, 3]
  end

  it 'should have zero speed initially' do
    expect(mech.speed).to eq Vector[0, 0]
  end

  describe :turret do
    it 'should be a turret object' do
      expect(mech.turret).to be_a Turret
    end
  end
end
