require_relative 'node'
require_relative 'null_node'

class BST
  attr_accessor :head, :array

  def initialize(head = NullNode::DEFAULT)
    @head = head
    @sorted_array = []
    @leaves = []
  end

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
        insert(node_value, here.left)
      else
        insert(node_value, here.right)
      end
    end
    self
  end

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
  end

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
  end

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
  end

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
  end

  def sort(here = @head, sorted_array = @sorted_array)
    if here == NullNode::DEFAULT
      return
    else
      sort(here.left)
      sorted_array << here.data
      sort(here.right)
    end
    sorted_array
  end

  def delete(value, here = @head, mother = @head)
    if here == NullNode::DEFAULT || !include?(value)
      puts "Can't delete #{value} because it is not in the tree."
      return
    else
      if here.data < value
        delete(value, here.right, here)
      elsif here.data > value
        delete(value, here.left, here)
      else
        children = number_of_children(here)
        case children
        when 'Both'
          two_child_replace(here)
        when 'Left'
          one_child_replace(here.left, mother)
        when 'Right'
          one_child_replace(here.right, mother)
        else
          no_children_replace(here, mother)
        end
      end
    end
    #here.data                                                      # => "g", "f", "d"
  end

  def number_of_children(here)
    if here.left != NullNode::DEFAULT && here.right != NullNode::DEFAULT
      'Both'
    elsif here.left != NullNode::DEFAULT
      'Left'
    elsif here.right != NullNode::DEFAULT
      'Right'
    else
      'None'
    end
  end

  def one_child_replace(here, mother)
    if here.data < mother.data
      mother.left = here
    else
      mother.right = here
    end
  end

  def no_children_replace(here, mother)
    if here.data <= mother.data
      mother.left = NullNode::DEFAULT
    else
      mother.right = NullNode::DEFAULT
    end
  end

  def two_child_replace(here)
    subtree_max = maximum(here.left)
    here.data = subtree_max
    delete(subtree_max, here.left, here)
  end

  def number_of_leaves(here = @head, leaves = @leaves)
    if here == NullNode::DEFAULT
      return 0
    else
      if here.left == NullNode::DEFAULT && here.right == NullNode::DEFAULT
        leaves << here.data
      end
      number_of_leaves(here.left, leaves)
      number_of_leaves(here.right, leaves)
    end
    leaves.count
  end

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
  end

  def create_tree
    handle = File.open('/Users/shannonpaige/code/binary-search-trees/tree_nodes.txt')
    handle.each_line do |line|
      insert("#{line.chomp}")
    end
  end

  def output_tree
    handle = File.open('/Users/shannonpaige/code/binary-search-trees/tree_output.txt', 'w')
    output = sort
    output.each do |node|
      handle.write("#{node}\n")
    end
    handle.flush
  end
end
