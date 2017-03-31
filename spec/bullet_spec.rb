require 'spec_helper'
require 'bullet'


describe Bullet do
  let(:bullet) { Bullet.new Vector[2, 3], 0 }

  it 'should initialise the position' do
    expect(bullet.position).to eq Vector[2, 3]
  end

  it 'should set the speed' do
    expect(bullet.speed).to eq Vector[Bullet::SPEED, 0]
  end

  it 'should set the direction' do
    expect(bullet.direction).to eq 0
  end

  context 'when the direction is non-zero' do
    let(:bullet) { Bullet.new Vector[2, 3], Math::PI / 2 }

    it 'should set the direction' do
      expect(bullet.direction).to eq Math::PI / 2
    end

    it 'should set the speed accordingly' do
      expect(bullet.speed).to be_within(1e-6).of Vector[0, Bullet::SPEED]
    end
  end

  context 'when the life time of the bullet is expired' do
    let(:finish) { bullet.update(Bullet::LIFE_TIME, double('joystick')).first }

    it 'should finish with an explosion' do
      expect(finish).to be_an Explosion
    end

    it 'should set the position of the explosion correctly' do
      expect(finish.position).to be_within(1e-6).of Vector[2 + Bullet::SPEED * Bullet::LIFE_TIME, 3]
    end
  end
end
