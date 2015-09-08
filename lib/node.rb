require_relative 'null_node'

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = NullNode::DEFAULT
    @right = NullNode::DEFAULT
  end

  def insert(node_value)
    if node_value < data
      self.left = left.insert(node_value)
    else
      self.right = right.insert(node_value)
    end
    self
  end
end
