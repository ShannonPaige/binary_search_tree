require_relative "null_node"  # => true

class Node
  attr_accessor :data, :left, :right  # => nil

  def initialize(data)
    @data = data                # => :data
    @left = NullNode::DEFAULT   # => #<NullNode:0x007fe67385cc88>
    @right = NullNode::DEFAULT  # => #<NullNode:0x007fe67385cc88>
  end                           # => :initialize
end                             # => :initialize

Node.new(:data)  # => #<Node:0x007fe673857a30 @data=:data, @left=#<NullNode:0x007fe67385cc88>, @right=#<NullNode:0x007fe67385cc88>>
