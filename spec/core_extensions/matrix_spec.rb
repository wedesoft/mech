require 'core_extensions/matrix'


describe Vector do
  describe :sqr do
    it 'should return the square norm' do
      expect(Vector[3, 4].sqr).to eq 25
    end
  end
end
