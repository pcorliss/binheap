require_relative 'bin_heap.rb'

class MedianStream
  def initialize
    @low = BinHeap.new(:max)
    @high = BinHeap.new(:min)
  end

  def median
    return nil if @low.size == 0 && @high.size == 0
    if @low.size == @high.size
      (@low.peek + @high.peek) / 2.to_f
    else
      heap = @low.size > @high.size ? @low : @high
      heap.peek
    end
  end

  def push(n)
    if @low.peek.nil? || @low.peek >= n
      @low.push(n)
    else
      @high.push(n)
    end

    while (@low.size - @high.size).abs > 1
      small, large = @low, @high
      small, large = @high, @low if small.size > large.size
      small.push(large.pop)
    end
  end
end

