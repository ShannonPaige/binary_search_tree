require_relative "node"
require_relative "null_node"

class BST
  attr_accessor :head

  def initialize(head = NullNode::DEFAULT)
    @head = head
  end

  def bst_empty?
    @head == NullNode::DEFAULT
  end

  def insert(node_value, here = @head)
    if bst_empty?
      @head = Node.new(node_value)
    else
      new_node = Node.new(node_value)
      if new_node.data < here.data && here.left == NullNode::DEFAULT
        here.left = new_node
        return
      elsif new_node.data > here.data && here.right == NullNode::DEFAULT
        here.right = new_node
        return
      elsif new_node.data < here.data
        here = here.left
        insert(node_value, here)
      else
        here = here.right
        insert(node_value, here)
      end
    end
    self
  end

  # def include?(value, here = @head)
  #   if bst_empty? # => false
  #     include = false
  #   else
  #     if here.data == value # => true
  #       value # => "d"
  #       include = true # => true
  #       include # => true
  #       return # =>
  #     # elsif here.data < value
  #     #   here = here.right
  #     #   include?(value, here)
  #     # else
  #     #   here = here.left
  #     #   include?(value, here)
  #     end # =>
  #   end # =>
  #   include # =>
  # end

  def depth_of
    # report the depth of a node in the tree with depth_of
  end

  def maximum
    # find the maximum value in the tree
  end

  def minimum
    # find the minimum value in the tree
  end

  def sort
    # implement a sort that outputs an array of the values in sorted order (by traversing the tree, not using Ruby's sort method)
  end

  def delete
    # As the final challenge, add the ability to delete a value from the tree and repair the tree.
  end

  def number_of_leaves
    # find the total number of leaves on the tree
  end

  def height
    # report the (maximum) height of the tree
  end
end

tree = BST.new
tree.insert("d")
# tree.insert("b") # => nil
# tree.insert("a")
# tree.insert("c") # => #<BST:0x007fe0118429e0 @head=#<Node:0x007fe011842760 @data="d", @left=#<Node:0x007fe011842120 @data="b", @left=#<Node:0x007fe011841ec8 @data="a", @left=#<NullNode:0x007fe0118433b8>, @right=#<NullNode:0x007fe0118433b8>>, @right=#<Node:0x007fe011841a18 @data="c", @left=#<NullNode:0x007fe0118433b8>, @right=#<NullNode:0x007fe0118433b8>>>, @right=#<NullNode:0x007fe0118433b8>>>
# tree.insert("f")
# tree.insert("e")
# tree.insert("g")
tree # => #<BST:0x007fd584830070 @head=#<Node:0x007fd584830020 @data="d", @left=#<NullNode:0x007fd584830b60>, @right=#<NullNode:0x007fd584830b60>>>
tree.head.data
tree.include?("d") # => nil
