# ecoPortal hiring test

*Q1: The basics*

In ruby, implement ruby's `Array#flatten(n)` (without using `flatten`):

    def squish(arr, n = nil)
    end

    # Example usage:
    squish([1])         # [1]
    squish([[1],2])     # [1, 2]
    squish([[1,[2]]],1) # [1, [2]]

*Q2: A puzzle*

Using either javascript or coffeescript, create a definition for `Chain`
such that (example given in coffeescript):

    foo = Chain("h")
    bar = foo("e")("l")("l")("o")

    foo.toString()          == "h"
    bar.toString()          == "hello"
    bar.ancestor.toString() == "hell"

*Q3: Reviewing/refactoring*

Comment on the following piece of "library" code with respect to purpose and
style. Identify issues and how you would fix them, or any suggested
improvements.

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
    puts q.deQ # check this is "a"
    q.add("a", 42)
    puts q.deQ # check this is 42
    puts q.deQ # check this is dog
    puts q.deQ # check this is a
    puts q.deQ # check this is nothing
  
*Q4: Modelling*

In pseudocode with the intention of using a MongoDB backend, how would you
model the following:

A record has:
- Many custom fields which each have a label and some text data
- A reference to a number of users which are involved in it
- A priority

Whenever a record is created or updated, it is necessary to check against the
data in the custom fields for certain keywords. If found, these keywords will
raise the priority.

Briefly outline the strengths/weaknesses/capabilities of your approach.

*Q5: The kitchen sink*

Navigate to the `Q5/` directory provided with this test. This contains a minimal
webapp done in `sinatra` with an angular skeleton already configured. You can
start it by running `ruby app.rb` (don't forget to `bundle` first).

The webapp as is will respond with a GET to `/data` with data in the following
format:

    1,One,
    2,Two,1
    3,Three,1
    4,Four,2
    ...

Which represents a tree stored as: ID, Name, ParentID. Modify this
micro-application to display the data as a set of `ul` and `li` on the page -
using the example above, it would be visually represented as:

    - One
      - Two
        - Four
      - Three

You can modify any part of the code as long as `/data` transmits some
non-html representation of the above data and angular transforms it into
the an on-page html structure.

The webapp has been set up so you can use the SASS preprocessor if you wish,
and both coffeescript and javascript angular skeletons have been provided. The
application will default to using `.coffee` files - if you do not wish to use
coffeescript, simply remove these files and it'll fall back to the provided
`.js` alternatives.

If there's any extra features or clever things you want to add, we'd love to see
them - but it's entirely optional.

*All done!*

When you're done, commit your changes using git and send this folder back to us.
