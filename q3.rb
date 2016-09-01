require 'set'
class PQ
  def initialize
    @x = SortedSet.new
  end
  class El
    attr_reader :p, :x
    def initialize(p,x)
      @p = p
      @x = x
    end
    def <=>(y)
      @p <=> y.p
    end
  end
  def add(item, priority)
    @x.add(El.new(priority,item))
  end
  def deQ
    return unless item = @x.first
    @x.delete(item)
    item.x
  end
end

# Tests
q = PQ.new
q.add(42, 21)
q.add("a", 15)
q.add(:dog, 37)
puts q.deQ # check this is a
q.add("a", 42)
puts q.deQ # check this is 42
puts q.deQ # check this is dog
puts q.deQ # check this is a
puts q.deQ # check this is nothing

__END__

Comment away!
