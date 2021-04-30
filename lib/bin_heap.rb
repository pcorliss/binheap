class BinHeap
  def initialize(t = :min)
    @t = t
    @arr = []
  end

  def push(n)
    val = _min? ? n : -n
    @arr.push(val)
    _bubble_up!(@arr.length - 1)
  end

  def peek
    return nil if @arr.empty?
    n = @arr.first
    _min? ? n : -n
  end

  def pop
    _swap(0, @arr.length - 1)
    n = @arr.pop
    _bubble_down!(0)
    _min? ? n : -n
  end

  def to_a
    @arr
  end

  def size
    @arr.size
  end

  def _min?
    @t == :min
  end

  def _parent(idx)
    level = Math.log2(idx + 1).to_i
    offset = (idx - ((2 ** level) - 1)) / 2
    offset + (2 ** (level - 1)) - 1
  end

  def _child(idx)
    level = Math.log2(idx + 1).to_i
    offset = (idx - ((2 ** level) - 1)) * 2
    offset + (2 ** (level + 1)) - 1
  end

  def _swap(a_idx, b_idx)
    tmp = @arr[a_idx]
    @arr[a_idx] = @arr[b_idx]
    @arr[b_idx] = tmp
  end

  def _bubble_down!(idx)
    a = @arr[idx]
    b_idx = _child(idx)
    c_idx = b_idx + 1
    b = @arr[b_idx]
    c = @arr[c_idx]
    # puts "A: #{a} B: #{b} C: #{c} - #{to_a}"
    if (b && a > b) || (c && a > c)
      if !c || b < c
        # puts "\tSwap: a and b"
        _swap(idx, b_idx)
        _bubble_down!(b_idx)
      else
        # puts "\tSwap: a and c"
        _swap(idx, c_idx)
        _bubble_down!(c_idx)
      end
    end
  end

  def _bubble_up!(idx)
    a = @arr[idx]
    p_idx = _parent(idx)
    p = @arr[p_idx]
    # puts "Pushed: #{a} Parent: #{p}"
    if a < p
      # puts "\tPushed is less than parent! Swapping and bubbling"
      _swap(idx, p_idx)
      _bubble_up!(p_idx)
    end
  end
end
