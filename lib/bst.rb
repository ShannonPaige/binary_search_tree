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
      elsif new_node.data > here.data && here.right == NullNode::DEFAULT
        here.right = new_node
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

  def include?(value, here = @head)
    if bst_empty?
      include = false
    else
      here
      if here == NullNode::DEFAULT
        return false
      elsif here.data == value
        return true
      elsif here.data < value
        here = here.right
        include?(value, here)
      else
        here = here.left
        include?(value, here)
      end
    end
  end

  def depth_of
    # report the depth of a node in the tree with depth_of
  end

  def maximum(here = @head)
    # find the maximum value in the tree
    if bst_empty?
      max = nil
    else
      if here.left == NullNode::DEFAULT
        return here.data
      else
        here = here.left
        maximum(here)
      end
    end
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
tree.insert("a")
tree.insert("c")
tree.insert("f")
tree.insert("e")
tree.insert("g")
tree
