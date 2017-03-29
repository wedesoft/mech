require 'core_extensions/numeric'


describe Numeric do
  describe :limit do
    it 'should return small positive values' do
      expect(+5.limit(10)).to eq +5
    end

    it 'should return small negative values' do
      expect(-5.limit(10)).to eq -5
    end

    it 'should clip large positive values' do
      expect(+15.limit(10)).to eq +10
    end

    it 'should clip large negative values' do
      expect(-15.limit(10)).to eq -10
    end
  end
end
