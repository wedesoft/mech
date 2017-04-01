require 'turret'
require 'unit'


describe Turret do
  let(:base) { Unit.new Vector[2, 3], Vector[1, 0] }
  let(:turret) { Turret.new base, Vector[1, 2] }

  it 'should use a position relative to the base unit' do
    expect(turret.position).to eq Vector[3, 5]
  end

  context 'when the base is moving' do
    before :each do
      base.update 1, double('joystick')
    end

    it 'should move with it' do
      expect(turret.position).to eq Vector[4, 5]
    end
  end

  context 'when the base is rotated' do
    let(:base) { Unit.new Vector[2, 3], Vector[1, 0], Math::PI / 2 }

    it 'should rotate the relative position' do
      expect(turret.position).to eq Vector[0, 4]
    end
  end

  describe :direction do
    it 'should have a direction of zero by default' do
      expect(turret.direction).to eq 0
    end

    context 'when the direction is specified' do
      let(:turret) { Turret.new base, Vector[1, 2], Math::PI / 4 }

      it 'should use it' do
        expect(turret.direction).to eq Math::PI / 4
      end

      context 'when the base is rotated' do
        let(:base) { Unit.new Vector[2, 3], Vector[1, 0], Math::PI / 2 }

        it 'should use the combined rotation' do
          expect(turret.direction).to eq 3 * Math::PI / 4
        end
      end
    end
  end
end
