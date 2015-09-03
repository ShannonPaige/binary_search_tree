class NullNode

  DEFAULT = NullNode.new  # => #<NullNode:0x007ff1838ff288>
  def initialize
    @data = nil
  end                     # => :initialize

  def delete(data)
  end               # => :delete
end                 # => :delete

  # => #<NullNode:0x007ff1838ff288>
