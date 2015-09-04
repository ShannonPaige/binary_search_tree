require_relative "node"       # => true
require_relative "null_node"  # => false

class BST
  attr_accessor :head  # => nil

  def initialize(head = NullNode::DEFAULT)
    @head = head                            # => #<NullNode:0x007f86ab8c2f88>
  end                                       # => :initialize

  def bst_empty?
    @head == NullNode::DEFAULT  # => true, false, false, false, false, false, false, false, false, false, false, false, false, false
  end                           # => :bst_empty?

  def insert(node_value, here = @head)
    if bst_empty?                                                         # => true, false, false, false, false, false, false, false, false, false, false
      @head = Node.new(node_value)                                        # => #<Node:0x007f86ab8bbf80 @data="d", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>
    else
      new_node = Node.new(node_value)                                     # => #<Node:0x007f86ab8bb058 @data="b", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8b94d8 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8b0f40 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8a3f70 @data="f", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8a2418 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab898d78 @data="g", @left=#<Nul...
      if new_node.data < here.data && here.left == NullNode::DEFAULT      # => true, false, true, false, false, false, false, true, false, false
        here.left = new_node                                              # => #<Node:0x007f86ab8bb058 @data="b", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>
      elsif new_node.data > here.data && here.right == NullNode::DEFAULT  # => false, false, true, true, false, false, true
        here.right = new_node                                             # => #<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8a3f70 @data="f", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8980a8 @data="g", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>
      elsif new_node.data < here.data                                     # => true, true, false, false
        here = here.left                                                  # => #<Node:0x007f86ab8bb058 @data="b", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>
        insert(node_value, here)                                          # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>>, #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, @right=#<NullNode:0x007f86ab8c2f88>>>
      else
        here = here.right                                                 # => #<Node:0x007f86ab8a3f70 @data="f", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8a3f70 @data="f", @left=#<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>
        insert(node_value, here)                                          # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, @right=#<Node:0x007f86ab8a3f70 @data="f", @left=#<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>>>, #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, @right=#<Node:0x007f86ab8a3f70 @data="f", @left...
      end                                                                 # => #<Node:0x007f86ab8bb058 @data="b", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>>, #<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f8...
    end                                                                   # => #<Node:0x007f86ab8bbf80 @data="d", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8bb058 @data="b", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>>, #<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @ri...
    self                                                                  # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>>, #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>>, #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>, @right...
  end                                                                     # => :insert

  def include?(value, here = @head)
    if bst_empty?                      # => false, false, false
      include = false
    else
      here                             # => #<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, @right=#<Node:0x007f86ab8a3f70 @data="f", @left=#<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8980a8 @data="g", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>>, #<Node:0x007f86ab8a3f70 @data="f", @left=#<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8980a8 @data="g", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, #<Node:0x007f86ab8980a8 @data="g", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f...
      if here == NullNode::DEFAULT  # => false, false
        return false                   # => true
      elsif here.data == value            # => false, false, true
        return true
      elsif here.data < value          # => true, true
        here = here.right              # => #<Node:0x007f86ab8a3f70 @data="f", @left=#<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8980a8 @data="g", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, #<Node:0x007f86ab8980a8 @data="g", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>
        include?(value, here)          # => true, true
      else
        here = here.left
        include?(value, here)
      end
    end
  end                                  # => :include?

  def depth_of
    # report the depth of a node in the tree with depth_of
  end           # => :depth_of

  def maximum
    # find the maximum value in the tree
  end          # => :maximum

  def minimum
    # find the minimum value in the tree
  end          # => :minimum

  def sort
    # implement a sort that outputs an array of the values in sorted order (by traversing the tree, not using Ruby's sort method)
  end       # => :sort

  def delete
    # As the final challenge, add the ability to delete a value from the tree and repair the tree.
  end         # => :delete

  def number_of_leaves
    # find the total number of leaves on the tree
  end                   # => :number_of_leaves

  def height
    # report the (maximum) height of the tree
  end         # => :height
end           # => :height

tree = BST.new      # => #<BST:0x007f86ab8c0558 @head=#<NullNode:0x007f86ab8c2f88>>
tree.insert("d")    # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>
tree.insert("b")    # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>>
tree.insert("a")    # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>>
tree.insert("c")    # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, @right=#<NullNode:0x007f86ab8c2f88>>>
tree.insert("f")    # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, @right=#<Node:0x007f86ab8a3f70 @data="f", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>>
tree.insert("e")    # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, @right=#<Node:0x007f86ab8a3f70 @data="f", @left=#<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<NullNode:0x007f86ab8c2f88>>>>
tree.insert("g")    # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, @right=#<Node:0x007f86ab8a3f70 @data="f", @left=#<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8980a8 @data="g", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>>>
tree                # => #<BST:0x007f86ab8c0558 @head=#<Node:0x007f86ab8bbf80 @data="d", @left=#<Node:0x007f86ab8bb058 @data="b", @left=#<Node:0x007f86ab8b3970 @data="a", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8b01d0 @data="c", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>, @right=#<Node:0x007f86ab8a3f70 @data="f", @left=#<Node:0x007f86ab8a0eb0 @data="e", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>, @right=#<Node:0x007f86ab8980a8 @data="g", @left=#<NullNode:0x007f86ab8c2f88>, @right=#<NullNode:0x007f86ab8c2f88>>>>>
tree.head.data      # => "d"
# tree.include?("d") # => true
tree.include?("g")  # => true
# tree.include?("s") # => false
