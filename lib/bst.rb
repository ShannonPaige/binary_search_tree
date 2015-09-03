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

  def insert(node_value)
    if bst_empty?
      @head = Node.new(node_value)
    else
    here = @head
    new_node = Node.new(node_value) # => #<Node:0x007f9871917f60 @data="b", @left=#<NullNode:0x007f987191d118>, @right=#<NullNode:0x007f987191d118>>
    if new_node.data < here.data
      here.left = new_node
    else
      here.right = new_node
    end 
  end
  end

  def include?
    # verify/reject the presence of a value in the tree with include?
  end

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
tree.insert("b")
#               .insert("a")
#               .insert("c")
#             .insert("f")
#               .insert("e")
#               .insert("g")
tree # => #<BST:0x007f987191c010 @head=#<Node:0x007f9871917fb0 @data="d", @left=#<Node:0x007f9871917f60 @data="b", @left=#<NullNode:0x007f987191d118>, @right=#<NullNode:0x007f987191d118>>, @right=#<NullNode:0x007f987191d118>>>
