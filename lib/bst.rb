require_relative "node"       # => true
require_relative "null_node"  # => false

class BST
  attr_accessor :head, :array  # => nil

  def initialize(head = NullNode::DEFAULT)
    @head = head                            # => #<NullNode:0x007ff52c0e2e68>
    @sorted_array = []                      # => []
  end                                       # => :initialize

  def insert(node_value, here = @head)
    if @head == NullNode::DEFAULT
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
    if @head == NullNode::DEFAULT
      return -1
    elsif value == here.data
      return counter
    elsif value < here.data
      here = here.left
      counter += 1
      depth_of(value, here, counter)
    else
      here = here.right
      counter += 1
      depth_of(value, here, counter)
    end
  end                                             # => :depth_of

  def maximum(here = @head)
    if @head == NullNode::DEFAULT
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
    if @head == NullNode::DEFAULT
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

  # def sort(here = @head, sorted_array = @sorted_array)
  #   if here == NullNode::DEFAULT                        # => false, false, false, true, true, true, false, true
  #   else here.left != NullNode::DEFAULT                 # => true, true, false, false
  #     traverse_left(here, sorted_array)                 # => [], ["a", "ab"], ["a", "ab", "b", "c"], ["a", "ab", "b", "c", "d"]
  #     add_to_array(here, sorted_array)                  # => ["a"], ["a", "ab", "b"], ["a", "ab", "b", "c", "d"], ["a", "ab", "b", "c", "d", "e"]
  #     if here.right !=NullNode::DEFAULT                 # => true, true, true, false
  #       here = here.right                               # => #<Node:0x007fd75582ccb8 @data="ab", @left=#<NullNode:0x007fd75585eb28>, @right=#<NullNode:0x007fd75585eb28>>, #<Node:0x007fd75584c950 @data="c", @left=#<NullNode:0x007fd75585eb28>, @right=#<NullNode:0x007fd75585eb28>>, #<Node:0x007fd755845a10 @data="f", @left=#<Node:0x007fd75583f278 @data="e", @left=#<NullNode:0x007fd75585eb28>, @right=#<NullNode:0x007fd75585eb28>>, @right=#<Node:0x007fd755835fc0 @data="g", @left=#<NullNode:0x007fd75585eb28>, @right=#<NullNode:0x007fd75585eb28>>>
  #       here.data                                       # => "ab", "c", "f"
  #       traverse_left(here, sorted_array)               # => ["a"], ["a", "ab", "b"], ["a", "ab", "b", "c", "d", "e"]
  #       add_to_array(here, sorted_array)                # => ["a", "ab"], ["a", "ab", "b", "c"], ["a", "ab", "b", "c", "d", "e", "f"]
  #     end                                               # => ["a", "ab"], ["a", "ab", "b", "c"], nil, ["a", "ab", "b", "c", "d", "e", "f"]
  #   # else
  #   #   if here.right == NullNode::DEFAULT                # => false, true
  #   #     add_to_array(here, sorted_array)                # => ["b", "c", "d", "e"]
  #   #   end                                               # => nil, ["b", "c", "d", "e"]
  #   end                                                 # => nil, nil, ["a", "ab"], nil, ["a", "ab", "b", "c"], nil, nil, ["a", "ab", "b", "c", "d", "e", "f"]
  #   sorted_array                                        # => [], ["a"], ["a", "ab"], ["a", "ab", "b"], ["a", "ab", "b", "c"], ["a", "ab", "b", "c", "d"], ["a", "ab", "b", "c", "d", "e"], ["a", "ab", "b", "c", "d", "e", "f"]
  # end                                                   # => :sort


  def sort(here = @head, mother = @head, sorted_array = @sorted_array)
    if here == NullNode::DEFAULT                                        # => true
      return
    else
      sort(here.left, here)
      sorted_array << here.data
      sort(here.right, here)
    end
    sorted_array
  end                                                                   # => :sort

  # def delete(value, here = @head, mother = @head)
  #   # As the final challenge, add the ability to delete a value from the tree and repair the tree.
  #   # Ask a node to delete the node and return itslef.
  #   # When you find the node have it return null node
  #   # what to do about children?
  #   if here == NullNode::DEFAULT
  #     return
  #   else
  #     delete(value, here.left, here)
  #     #when deleting a leaf
  #     if here.data == value
  #       if here.data < mother.data
  #         mother.left = NullNode::DEFAULT
  #         return
  #       else
  #         here.data
  #         mother.data
  #         mother.right.data
  #         mother.right = NullNode::DEFAULT
  #         return
  #       end
  #     end
  #     delete(value, here.right, here)
  #   end
  #   self
  # end                                              # => :delete

  def number_of_leaves
    # find the total number of leaves on the tree
    # Make counter to count a leaf
    # go through every node on the tree
    # when left and right are null, add to counter
  end                   # => :number_of_leaves

  def height
    nodes = sort                   # => nil
    depths = []                    # => []
    nodes                          # => nil
    if nodes.nil?                  # => true
      return -1                     # => 0
    else
      nodes.each do |value|
        value
        depth_of(value)
        depths << depth_of(value)
      end
      depths.sort.pop
    end
  end                              # => :height
end                                # => :height

tree = BST.new  # => #<BST:0x007ff52c0e0898 @head=#<NullNode:0x007ff52c0e2e68>, @sorted_array=[]>
# tree.insert("d")
# tree.insert("b")
# tree.insert("a")
# tree.insert("c")
# tree.insert("f")
# tree.insert("e")
# tree.insert("g")
# tree.insert("ab")

tree         # => #<BST:0x007ff52c0e0898 @head=#<NullNode:0x007ff52c0e2e68>, @sorted_array=[]>
tree.height  # => 0
