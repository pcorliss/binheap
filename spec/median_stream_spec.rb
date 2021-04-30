require './lib/median_stream.rb'

describe MedianStream do
  it 'inits a median stream' do
    expect(subject).to be_a(MedianStream)
  end

  describe '#median' do
    it 'returns nil for an empty stream' do
      expect(subject.median).to be_nil
    end

    it 'returns the only value' do
      subject.push(99)
      expect(subject.median).to eq(99)
    end

    it 'returns the median value' do
      subject.push(3)
      subject.push(4)
      subject.push(5)
      subject.push(1)
      subject.push(2)
      # puts subject.inspect
      expect(subject.median).to eq(3)
    end

    it 'returns the average of two values' do
      subject.push(3)
      subject.push(4)
      subject.push(1)
      subject.push(2)
      # puts subject.inspect
      expect(subject.median).to eq(2.5)
    end
  end

  context 'validation' do
    it 'returns the median for a large random list' do
      n = 101
      range = 100
      arr = n.times.map do 
        val = rand(range)
        subject.push(val)
        val
      end

      arr.sort!
      median = arr[n / 2]

      # require 'pry'
      # binding.pry
      expect(subject.median).to eq(median)
    end
  end
end
