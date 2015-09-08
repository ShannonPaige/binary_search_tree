class NullNode
  DEFAULT = NullNode.new
  def initialize
    @data = nil
  end

  def insert(node_value)
    Node.new(node_value)
  end
end
