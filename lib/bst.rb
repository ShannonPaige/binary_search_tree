require_relative "node"       # => true
require_relative "null_node"  # => false

class BST
  attr_accessor :head, :array  # => nil

  def initialize(head = NullNode::DEFAULT)
    @head = head                            # => #<NullNode:0x007fdb0b0bf818>
    @sorted_array = []                      # => []
    @leaves = []                            # => []
  end                                       # => :initialize

  def insert(node_value, here = @head)
    if @head == NullNode::DEFAULT                                         # => true, false, false, false, false, false, false, false, false, false, false
      @head = Node.new(node_value)                                        # => #<Node:0x007fdb0b0bc050 @data="d", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>
    else
      new_node = Node.new(node_value)                                     # => #<Node:0x007fdb0b0b7398 @data="b", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0b5e08 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0ae9a0 @data="c", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0add98 @data="c", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0a69f8 @data="f", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0a4720 @data="e", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b09fba8 @data="e", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b09ef28 @data="g", @left=#<Nul...
      if new_node.data < here.data && here.left == NullNode::DEFAULT      # => true, false, true, false, false, false, false, true, false, false
        here.left = new_node                                              # => #<Node:0x007fdb0b0b7398 @data="b", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b09fba8 @data="e", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>
      elsif new_node.data > here.data && here.right == NullNode::DEFAULT  # => false, false, true, true, false, false, true
        here.right = new_node                                             # => #<Node:0x007fdb0b0add98 @data="c", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0a69f8 @data="f", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0a933568 @data="g", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>
      elsif new_node.data < here.data                                     # => true, true, false, false
        here = here.left                                                  # => #<Node:0x007fdb0b0b7398 @data="b", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>
        insert(node_value, here)                                          # => #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<Node:0x007fdb0b0add98 @data="c", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>
      else
        here = here.right                                                 # => #<Node:0x007fdb0b0a69f8 @data="f", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0a69f8 @data="f", @left=#<Node:0x007fdb0b09fba8 @data="e", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>
        insert(node_value, here)                                          # => #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<Node:0x007fdb0b0add98 @data="c", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>>, @right=#<Node:0x007fdb0b0a69f8 @data="f", @left=#<Node:0x007fdb0b09fba8 @data="e", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<Node:0x007fdb0b0add98 @data="c", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>>, @right=#<Node:0x0...
      end                                                                 # => #<Node:0x007fdb0b0b7398 @data="b", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>, #<Node:0x007fdb0b0add98 @data="c", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<Node:0x007fdb0b0add98 @data="c", @l...
    end                                                                   # => #<Node:0x007fdb0b0bc050 @data="d", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0b7398 @data="b", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>, #<Node:0x007fdb0b0add98 @data="c", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<N...
    self                                                                  # => #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0...
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

  def sort(here = @head, mother = @head, sorted_array = @sorted_array)
    if here == NullNode::DEFAULT                                        # => false, false, false, true, true, false, true, true, false, false, true, true, false, true, true
      return
    else
      sort(here.left, here)                                             # => nil, ["a"], nil, ["a", "b", "c"], nil, ["a", "b", "c", "d", "e"], nil
      sorted_array << here.data                                         # => ["a"], ["a", "b"], ["a", "b", "c"], ["a", "b", "c", "d"], ["a", "b", "c", "d", "e"], ["a", "b", "c", "d", "e", "f"], ["a", "b", "c", "d", "e", "f", "g"]
      sort(here.right, here)                                            # => nil, nil, ["a", "b", "c"], nil, nil, ["a", "b", "c", "d", "e", "f", "g"], ["a", "b", "c", "d", "e", "f", "g"]
    end
    sorted_array                                                        # => ["a"], ["a", "b", "c"], ["a", "b", "c"], ["a", "b", "c", "d", "e"], ["a", "b", "c", "d", "e", "f", "g"], ["a", "b", "c", "d", "e", "f", "g"], ["a", "b", "c", "d", "e", "f", "g"]
  end                                                                   # => :sort

  def delete(value, here = @head, mother = @head)
    if here == NullNode::DEFAULT
      return
    else
      delete(value, here.left, here)
      #when deleting a leaf
      if here.data == value
        if here.data < mother.data
          mother.left = here.left
          return
        else
          mother.right = NullNode::DEFAULT
          return
        end
      end
      delete(value, here.right, here)
    end
    here
  end                                              # => :delete

  def number_of_leaves(here = @head, mother = @head, leaves = @leaves)
    if here == NullNode::DEFAULT
      return 0
    else
      if here.left == NullNode::DEFAULT && here.right == NullNode::DEFAULT
        leaves << here.data
      end
      number_of_leaves(here.left, here, leaves)
      number_of_leaves(here.right, here, leaves)
    end
    leaves.count
  end                                                                       # => :number_of_leaves

  def height
    nodes = sort
    depths = []
    nodes
    if nodes.nil?
      return -1
    else
      nodes.each do |value|
        value
        depth_of(value)
        depths << depth_of(value)
      end
      depths.sort.pop
    end
  end                              # => :height

  def create_tree
    handle = File.open("Users/shannonpaige/code/binary-search-trees/tree_nodes.txt")  # => #<File:Users/shannonpaige/code/binary-search-trees/tree_nodes.txt>
    handle.each_line do |line|                                                        # => #<File:Users/shannonpaige/code/binary-search-trees/tree_nodes.txt>
      insert("#{line.chomp}")                                                         # => #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode:0x007fdb0b0bf818>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @right=#<NullNode:0x007fdb0b0bf818>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fdb0b0bce10 @head=#<Node:0x007fdb0b0bc050 @data="d", @left=#<Node:0x007fdb0b0b7398 @data="b", @left=#<Node:0x007fdb0b0b52f0 @data="a", @left=#<NullNode...
    end                                                                               # => #<File:Users/shannonpaige/code/binary-search-trees/tree_nodes.txt>
  end                                                                                 # => :create_tree

  def output_tree
    handle = File.open("Users/shannonpaige/code/binary-search-trees/tree_output.txt", "w")  # => #<File:Users/shannonpaige/code/binary-search-trees/tree_output.txt>
    output = sort                                                                           # => ["a", "b", "c", "d", "e", "f", "g"]
    output.each do |node|                                                                   # => ["a", "b", "c", "d", "e", "f", "g"]
      handle.write("#{node}\n")                                                             # => 2, 2, 2, 2, 2, 2, 2
    end                                                                                     # => ["a", "b", "c", "d", "e", "f", "g"]
    handle.flush                                                                            # => #<File:Users/shannonpaige/code/binary-search-trees/tree_output.txt>
  end                                                                                       # => :output_tree
end                                                                                         # => :output_tree

tree = BST.new    # => #<BST:0x007fdb0b0bce10 @head=#<NullNode:0x007fdb0b0bf818>, @sorted_array=[], @leaves=[]>
tree.create_tree  # => #<File:Users/shannonpaige/code/binary-search-trees/tree_nodes.txt>
tree.output_tree  # => #<File:Users/shannonpaige/code/binary-search-trees/tree_output.txt>
