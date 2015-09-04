require "bst"
require "node"

class BSTTest < MiniTest::Test

  def setup
    @new_list = BST.new
    @new_node = Node.new(:node_data)
    @new_node2 = Node.new(:node2_data)
  end

  def test_insert_adds_a_node_to_the_head_of_an_empty_binary_tree
    @new_list.insert("d")
    assert_equal "d", @new_list.head.data
    assert_equal NullNode::DEFAULT, @new_list.head.left
    assert_equal NullNode::DEFAULT, @new_list.head.right
  end

  def test_insert_adds_a_node_to_the_left_of_a_larger_node
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("a")
    assert_equal "b", @new_list.head.left.data
    assert_equal "a", @new_list.head.left.left.data
  end

  def test_insert_adds_a_node_to_the_right_of_a_smaller_node
    @new_list.insert("d")
    @new_list.insert("f")
    @new_list.insert("g")
    assert_equal "f", @new_list.head.right.data
    assert_equal "g", @new_list.head.right.right.data
  end

  def test_include_verify_or_rejects_the_presence_of_a_value_in_the_tree
    @new_list.insert("d")
    @new_list.insert("f")
    assert @new_list.include?("d")
    assert @new_list.include?("f")
    refute @new_list.include?("s")
  end

end
