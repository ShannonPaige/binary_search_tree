require_relative "node"       # => true
require_relative "null_node"  # => false

class BST
  attr_accessor :head, :array  # => nil

  def initialize(head = NullNode::DEFAULT)
    @head = head                            # => #<NullNode:0x007fef9a09b708>
    @sorted_array = []                      # => []
    @leaves = []                            # => []
  end                                       # => :initialize

  def insert(node_value, here = @head)
    if @head == NullNode::DEFAULT                                         # => true, false, false, false, false, false, false, false, false, false, false
      @head = Node.new(node_value)                                        # => #<Node:0x007fef9a098530 @data="d", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>
    else
      new_node = Node.new(node_value)                                     # => #<Node:0x007fef9a093530 @data="b", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a091dc0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a089c38 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a081da8 @data="f", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a0801d8 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a07bb60 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a0782a8 @data="g", @left=#<Nul...
      if new_node.data < here.data && here.left == NullNode::DEFAULT      # => true, false, true, false, false, false, false, true, false, false
        here.left = new_node                                              # => #<Node:0x007fef9a093530 @data="b", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a07bb60 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>
      elsif new_node.data > here.data && here.right == NullNode::DEFAULT  # => false, false, true, true, false, false, true
        here.right = new_node                                             # => #<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a081da8 @data="f", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a073c08 @data="g", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>
      elsif new_node.data < here.data                                     # => true, true, false, false
        insert(node_value, here.left)                                     # => #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>
      else
        insert(node_value, here.right)                                    # => #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>>, @right=#<Node:0x007fef9a081da8 @data="f", @left=#<Node:0x007fef9a07bb60 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>>, @right=#<Node:0x0...
      end                                                                 # => #<Node:0x007fef9a093530 @data="b", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>, #<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<Node:0x007fef9a088ec8 @data="c", @l...
    end                                                                   # => #<Node:0x007fef9a098530 @data="d", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a093530 @data="b", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>, #<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<N...
    self                                                                  # => #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a0...
  end                                                                     # => :insert

  def include?(value, here = @head)
    if here == NullNode::DEFAULT
      return false
    elsif here.data == value
      return true
    elsif here.data < value
      include?(value, here.right)
    else
      include?(value, here.left)
    end
  end                                # => :include?

  def depth_of(value, here = @head, counter = 0)
    if @head == NullNode::DEFAULT
      return -1
    elsif value == here.data
      return counter
    elsif value < here.data
      counter += 1
      depth_of(value, here.left, counter)
    else
      counter += 1
      depth_of(value, here.right, counter)
    end
  end                                             # => :depth_of

  def maximum(here = @head)
    if @head == NullNode::DEFAULT
      return nil
    else
      if here.right == NullNode::DEFAULT
        return here.data
      else
        maximum(here.right)
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
        minimum(here.left)
      end
    end
  end                                    # => :minimum

  def sort(here = @head, mother = @head, sorted_array = @sorted_array)
    if here == NullNode::DEFAULT                                        # => false, false, false, true, true, false, true, true, false, false, true, true, true
      return
    else
      sort(here.left, here)                                             # => nil, ["a"], nil, ["a", "b", "c"], nil, ["a", "b", "c", "d", "e"]
      sorted_array << here.data                                         # => ["a"], ["a", "b"], ["a", "b", "c"], ["a", "b", "c", "d"], ["a", "b", "c", "d", "e"], ["a", "b", "c", "d", "e", "f"]
      sort(here.right, here)                                            # => nil, nil, ["a", "b", "c"], nil, nil, ["a", "b", "c", "d", "e", "f"]
    end
    sorted_array                                                        # => ["a"], ["a", "b", "c"], ["a", "b", "c"], ["a", "b", "c", "d", "e"], ["a", "b", "c", "d", "e", "f"], ["a", "b", "c", "d", "e", "f"]
  end                                                                   # => :sort

  def delete(value, here = @head, mother = @head)
    children = "None"                                # => "None", "None", "None"
    if here == NullNode::DEFAULT                     # => false, false, false
      return
    else
      if here.data < value                           # => true, true, false
        delete(value, here.right, here)              # => #<Node:0x007fef9a073c08 @data="g", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a081da8 @data="f", @left=#<Node:0x007fef9a07bb60 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>
      elsif here.data > value                        # => false
        delete(value, here.left, here)
      else here.data == value                        # => true
        children = number_of_children(here, mother)  # => "None"
        case children                                # => "None"
        when "Both"
          subtree_max = maximum(here.left)
          here.data = subtree_max
          delete(subtree_max, here.left, here)
        when "Left"
          replace(here.left, mother)
        when "Right"
          replace(here.right, mother)
        else # "None"
          if here.data <= mother.data                # => false
            mother.left = NullNode::DEFAULT
          else
            mother.right = NullNode::DEFAULT         # => #<NullNode:0x007fef9a09b708>
          end                                        # => #<NullNode:0x007fef9a09b708>
        end                                          # => #<NullNode:0x007fef9a09b708>
      end                                            # => #<NullNode:0x007fef9a09b708>, #<Node:0x007fef9a073c08 @data="g", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a081da8 @data="f", @left=#<Node:0x007fef9a07bb60 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>
    end
    here                                             # => #<Node:0x007fef9a073c08 @data="g", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a081da8 @data="f", @left=#<Node:0x007fef9a07bb60 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, #<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>>, @right=#<Node:0x007fef9a081da8 @data="f", @left=#<Node:0x007fef9a07bb60 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>>
  end                                                # => :delete

  def number_of_children(here, mother)
    if here.left != NullNode::DEFAULT && here.right != NullNode::DEFAULT  # => false
      children = "Both"
    elsif here.left != NullNode::DEFAULT                                  # => false
      children = "Left"
    elsif here.right != NullNode::DEFAULT                                 # => false
      children = "Right"
    else
      children = "None"                                                   # => "None"
    end                                                                   # => "None"
  end                                                                     # => :number_of_children

  def replace(here, mother)
    if here.data < mother.data
      mother.left = here
    else
      mother.right = here
    end
  end                           # => :replace

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
    if nodes.nil?
      return -1
    else
      nodes.each do |value|
        depths << depth_of(value)
      end
      depths.sort.pop
    end
  end                              # => :height

  def create_tree
    handle = File.open("/Users/shannonpaige/code/binary-search-trees/tree_nodes.txt")  # => #<File:/Users/shannonpaige/code/binary-search-trees/tree_nodes.txt>
    handle.each_line do |line|                                                         # => #<File:/Users/shannonpaige/code/binary-search-trees/tree_nodes.txt>
      insert("#{line.chomp}")                                                          # => #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>, @sorted_array=[], @leaves=[]>, #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNod...
    end                                                                                # => #<File:/Users/shannonpaige/code/binary-search-trees/tree_nodes.txt>
  end                                                                                  # => :create_tree

  def output_tree
    handle = File.open("/Users/shannonpaige/code/binary-search-trees/tree_output.txt", "w")
    output = sort
    output.each do |node|
      handle.write("#{node}\n")
    end
    handle.flush
  end                                                                                        # => :output_tree
end                                                                                          # => :output_tree

tree = BST.new    # => #<BST:0x007fef9a098f08 @head=#<NullNode:0x007fef9a09b708>, @sorted_array=[], @leaves=[]>
tree.create_tree  # => #<File:/Users/shannonpaige/code/binary-search-trees/tree_nodes.txt>
tree.delete("g")  # => #<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>>, @right=#<Node:0x007fef9a081da8 @data="f", @left=#<Node:0x007fef9a07bb60 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>>
tree.sort         # => ["a", "b", "c", "d", "e", "f"]
tree              # => #<BST:0x007fef9a098f08 @head=#<Node:0x007fef9a098530 @data="d", @left=#<Node:0x007fef9a093530 @data="b", @left=#<Node:0x007fef9a0914b0 @data="a", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<Node:0x007fef9a088ec8 @data="c", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>>, @right=#<Node:0x007fef9a081da8 @data="f", @left=#<Node:0x007fef9a07bb60 @data="e", @left=#<NullNode:0x007fef9a09b708>, @right=#<NullNode:0x007fef9a09b708>>, @right=#<NullNode:0x007fef9a09b708>>>, @sorted_array=["a", "b", "c", "d", "e", "f"], @leaves=[]>
