require_relative "node"       # => true
require_relative "null_node"  # => false

class BST
  attr_accessor :head, :array  # => nil

  def initialize(head = NullNode::DEFAULT)
    @head = head                            # => #<NullNode:0x007ffa3a9825d8>
    @sorted_array = []                      # => []
  end                                       # => :initialize

  def bst_empty?
    @head == NullNode::DEFAULT  # => true, false, false, false, false, false, false, false, false, false, false, false, false, false
  end                           # => :bst_empty?

  def insert(node_value, here = @head)
    if bst_empty?                                                         # => true, false, false, false, false, false, false, false, false, false, false, false, false, false
      @head = Node.new(node_value)                                        # => #<Node:0x007ffa3a97b5f8 @data="d", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>
    else
      new_node = Node.new(node_value)                                     # => #<Node:0x007ffa3a97a630 @data="b", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a978510 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a970db0 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a968e80 @data="f", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a962bc0 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a959958 @data="g", @left=#<Nul...
      if new_node.data < here.data && here.left == NullNode::DEFAULT      # => true, false, true, false, false, false, false, true, false, false, false, false, false
        here.left = new_node                                              # => #<Node:0x007ffa3a97a630 @data="b", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>
      elsif new_node.data > here.data && here.right == NullNode::DEFAULT  # => false, false, true, true, false, false, true, false, false, true
        here.right = new_node                                             # => #<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a968e80 @data="f", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a958c10 @data="g", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>
      elsif new_node.data < here.data                                     # => true, true, false, false, true, true
        here = here.left                                                  # => #<Node:0x007ffa3a97a630 @data="b", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, #<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>
        insert(node_value, here)                                          # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<Node:0x007ffa3c003...
      else
        here = here.right                                                 # => #<Node:0x007ffa3a968e80 @data="f", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a968e80 @data="f", @left=#<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>
        insert(node_value, here)                                          # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a968e80 @data="f", @left=#<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>>, @sorted_array=[]>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a968e8...
      end                                                                 # => #<Node:0x007ffa3a97a630 @data="b", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>, #<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNo...
    end                                                                   # => #<Node:0x007ffa3a97b5f8 @data="d", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a97a630 @data="b", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>, #<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x00...
    self                                                                  # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>, #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a...
  end                                                                     # => :insert

  def include?(value, here = @head)
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
  end                                # => :include?

  def depth_of(value, here = @head, counter = 0)
    if value == here.data                         # => false, false, true
      return counter                              # => 2
    elsif value < here.data                       # => true, true
      here = here.left                            # => #<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, #<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>
      counter += 1                                # => 1, 2
      depth_of(value, here, counter)              # => 2, 2
    else
      here = here.right
      counter += 1
      depth_of(value, here, counter)
    end
  end                                             # => :depth_of

  def maximum(here = @head)
    if bst_empty?
      return nil
    else
      if here.right == NullNode::DEFAULT
        return here.data
      else
        here = here.right
        maximum(here)
      end
    end
  end                                     # => :maximum

  def minimum(here = @head)
    if bst_empty?
      return nil
    else
      if here.left == NullNode::DEFAULT
        return here.data
      else
        here = here.left
        minimum(here)
      end
    end
  end                                    # => :minimum

  def sort(here = @head, sorted_array = @sorted_array)
    if here == NullNode::DEFAULT                        # => false, false, false, true, true, true, false, true
    else here.left != NullNode::DEFAULT                 # => true, true, false, false
      traverse_left(here, sorted_array)                 # => [], ["a", "ab"], ["a", "ab", "b", "c"], ["a", "ab", "b", "c", "d"]
      add_to_array(here, sorted_array)                  # => ["a"], ["a", "ab", "b"], ["a", "ab", "b", "c", "d"], ["a", "ab", "b", "c", "d", "e"]
      if here.right !=NullNode::DEFAULT                 # => true, true, true, false
        here = here.right                               # => #<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<Node:0x007ffa3a968e80 @data="f", @left=#<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a958c10 @data="g", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>
        here.data                                       # => "ab", "c", "f"
        traverse_left(here, sorted_array)               # => ["a"], ["a", "ab", "b"], ["a", "ab", "b", "c", "d", "e"]
        add_to_array(here, sorted_array)                # => ["a", "ab"], ["a", "ab", "b", "c"], ["a", "ab", "b", "c", "d", "e", "f"]
      end                                               # => ["a", "ab"], ["a", "ab", "b", "c"], nil, ["a", "ab", "b", "c", "d", "e", "f"]
    # else
    #   if here.right == NullNode::DEFAULT                # => false, true
    #     add_to_array(here, sorted_array)                # => ["b", "c", "d", "e"]
    #   end                                               # => nil, ["b", "c", "d", "e"]
    end                                                 # => nil, nil, ["a", "ab"], nil, ["a", "ab", "b", "c"], nil, nil, ["a", "ab", "b", "c", "d", "e", "f"]
    sorted_array                                        # => [], ["a"], ["a", "ab"], ["a", "ab", "b"], ["a", "ab", "b", "c"], ["a", "ab", "b", "c", "d"], ["a", "ab", "b", "c", "d", "e"], ["a", "ab", "b", "c", "d", "e", "f"]
  end                                                   # => :sort

  def traverse_left(here, sorted_array)
    mother = here                        # => #<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a968e80 @data="f", @left=#<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a958c10 @data="g", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>>, #<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode...
    here = here.left                     # => #<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, #<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, #<NullNode:0x007ffa3a9825d8>, #<NullNode:0x007ffa3a9825d8>, #<NullNode:0x007ffa3a9825d8>, #<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, #<NullNode:0x007ffa3a9825d8>
    sort(here, sorted_array)             # => [], ["a"], ["a", "ab"], ["a", "ab", "b"], ["a", "ab", "b", "c"], ["a", "ab", "b", "c", "d"], ["a", "ab", "b", "c", "d", "e"]
  end                                    # => :traverse_left

  def add_to_array(here, sorted_array)
    if !sorted_array.include?(here.data)  # => true, true, true, true, true, true, true
      sorted_array << here.data           # => ["a"], ["a", "ab"], ["a", "ab", "b"], ["a", "ab", "b", "c"], ["a", "ab", "b", "c", "d"], ["a", "ab", "b", "c", "d", "e"], ["a", "ab", "b", "c", "d", "e", "f"]
    end                                   # => ["a"], ["a", "ab"], ["a", "ab", "b"], ["a", "ab", "b", "c"], ["a", "ab", "b", "c", "d"], ["a", "ab", "b", "c", "d", "e"], ["a", "ab", "b", "c", "d", "e", "f"]
  end                                     # => :add_to_array

  def delete
    # As the final challenge, add the ability to delete a value from the tree and repair the tree.
  end         # => :delete

  def number_of_leaves
    # find the total number of leaves on the tree
  end                   # => :number_of_leaves

  def height
    # report the (maximum) height of the tree
    # if bst_empty?                          # => false, false, false
    #   return 0
    # else
    #   if here.left == NullNode::DEFAULT    # => false, false, true
    #     return counter                     # => 2
    #   else
    #     here = here.left                   # => #<Node:0x007f9f3aa05880 @data="b", @left=#<Node:0x007f9f3a9ff1d8 @data="a", @left=#<NullNode:0x007f9f3aa0e098>, @right=#<Node:0x007f9f3a9d6bc0 @data="ab", @left=#<NullNode:0x007f9f3aa0e098>, @right=#<NullNode:0x007f9f3aa0e098>>>, @right=#<Node:0x007f9f3a9f7c80 @data="c", @left=#<NullNode:0x007f9f3aa0e098>, @right=#<NullNode:0x007f9f3aa0e098>>>, #<Node:0x007f9f3a9ff1d8 @data="a", @left=#<NullNode:0x007f9f3aa0e098>, @right=#<Node:0x007f9f3a9d6bc0 @data="ab", @left=#<NullNode:0x007f9f3aa0e098>, @right=#<NullNode:0x007f9f3aa0e098>>>
    #     here.data                          # => "b", "a"
    #     counter += 1                       # => 1, 2
    #     depth_of(here, counter)            # => 2, 2
    #   end
    # end
  end         # => :height
end           # => :height

tree = BST.new     # => #<BST:0x007ffa3a980288 @head=#<NullNode:0x007ffa3a9825d8>, @sorted_array=[]>
tree.insert("d")   # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>
tree.insert("b")   # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>
tree.insert("a")   # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>
tree.insert("c")   # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<NullNode:0x007ffa3a9825d8>>, @sorted_array=[]>
tree.insert("f")   # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a968e80 @data="f", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @sorted_array=[]>
tree.insert("e")   # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a968e80 @data="f", @left=#<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<NullNode:0x007ffa3a9825d8>>>, @sorted_array=[]>
tree.insert("g")   # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a968e80 @data="f", @left=#<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a958c10 @data="g", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>>, @sorted_array=[]>
tree.insert("ab")  # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a968e80 @data="f", @left=#<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a958c10 @data="g", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>>, @sorted_array=[]>

tree                # => #<BST:0x007ffa3a980288 @head=#<Node:0x007ffa3a97b5f8 @data="d", @left=#<Node:0x007ffa3a97a630 @data="b", @left=#<Node:0x007ffa3a973880 @data="a", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<Node:0x007ffa3c003640 @data="ab", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a970860 @data="c", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>, @right=#<Node:0x007ffa3a968e80 @data="f", @left=#<Node:0x007ffa3a961540 @data="e", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>, @right=#<Node:0x007ffa3a958c10 @data="g", @left=#<NullNode:0x007ffa3a9825d8>, @right=#<NullNode:0x007ffa3a9825d8>>>>, @sorted_array=[]>
tree.sort           # => ["a", "ab", "b", "c", "d", "e", "f"]
tree.depth_of("a")  # => 2
