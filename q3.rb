require 'set'

class SortedItemSet
  def initialize
    @set = SortedSet.new
  end

  # if Item might be user outside of the main class its better to refactor it to separate file
  Item = Struct.new(:priority, :value) do
    def <=>(other)
      priority <=> other.priority
    end
  end

  def add(value, priority)
    raise ArgumentError unless priority.is_a? Integer
    item_new = Item.new(priority, value)
    @set.add(item_new)
  end

  def deQ
    item = @set.first
    return unless item
    @set.delete(item)
    item.value
  end
end

# Tests
q = SortedItemSet.new
q.add(42, 21)
q.add('a', 15)
q.add(:dog, 37)
puts q.deQ # check this is a
q.add('a', 42)
puts q.deQ # check this is 42
puts q.deQ # check this is dog
puts q.deQ # check this is a
puts q.deQ # check this is nothing

__END__

Comment away!
