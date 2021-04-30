require './lib/bin_heap.rb'

describe BinHeap do
  describe '#new' do
    it 'inits a heap' do
      expect(subject).to be_a(BinHeap)
    end

    it 'inits a min heap' do
      subject.push(3)
      subject.push(2)
      subject.push(1)
      expect(subject.peek).to eq(1)
    end

    it 'inits a max heap' do
      subject = BinHeap.new(:max)
      subject.push(3)
      subject.push(2)
      subject.push(1)
      expect(subject.peek).to eq(3)
    end
  end

  describe '#peek' do
    it 'returns the smallest element' do
      subject.push(3)
      subject.push(2)
      subject.push(1)
      expect(subject.peek).to eq(1)
    end

    it "doesn't remove the element" do
      subject.push(2)
      subject.peek
      expect(subject.size).to eq(1)
    end

    it 'returns nil if empty' do
      expect(subject.peek).to be_nil
    end
  end

  describe '#pop' do
    it 'returns the smallest element' do
      subject.push(3)
      subject.push(2)
      subject.push(1)
      expect(subject.pop).to eq(1)
    end

    it "removes the element" do
      subject.push(2)
      subject.pop
      expect(subject.size).to eq(0)
    end
  end

  describe '#push' do
    it 'adds an element' do
      subject.push(5)
      expect(subject.to_a).to eq([5])
    end
  end

  describe '#to_a' do
    it 'returns the heap' do
      subject.push(3)
      subject.push(2)
      subject.push(1)
      expect(subject.to_a).to eq([1,3,2])
    end
  end

  describe '#size' do
    it 'returns the current size of the heap' do
      subject.push(3)
      subject.push(2)
      expect(subject.size).to eq(2)
    end
  end

  describe '#_parent' do
    it 'returns the idx of the parent node in a binary tree' do
      expect(subject._parent(1)).to eql(0)
      expect(subject._parent(2)).to eql(0)
      expect(subject._parent(3)).to eql(1)
      expect(subject._parent(4)).to eql(1)
      expect(subject._parent(5)).to eql(2)
      expect(subject._parent(6)).to eql(2)
    end
  end

  describe '#_child' do
    it 'returns the idx of the first child node in a binary tree' do
      expect(subject._child(0)).to eql(1)
      expect(subject._child(1)).to eql(3)
      expect(subject._child(2)).to eql(5)
      expect(subject._child(3)).to eql(7)
      expect(subject._child(4)).to eql(9)
      expect(subject._child(5)).to eql(11)
      expect(subject._child(6)).to eql(13)
    end
  end

  context 'validation' do
    it 'returns a sorted large list' do
      n = 100
      range = 100
      arr = n.times.map do 
        val = rand(range)
        subject.push(val)
        val
      end

      arr.sort!

      # puts "Heap Start: #{subject.to_a}"

      heap_arr = n.times.map do |i|
        val = subject.pop
        # puts "#{i} - #{val} #{subject.to_a}"
        val
      end

      # puts arr.inspect
      # puts heap_arr.inspect
      expect(heap_arr).to eq(arr)
    end
  end
end
