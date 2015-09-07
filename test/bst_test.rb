require "bst"
require "node"

class BSTTest < MiniTest::Test

  def setup
    @new_list = BST.new
    # @new_list2 = BST.new
    # @new_node = Node.new(:node_data)
    # @new_node2 = Node.new(:node2_data)
  end

  def test_insert_method_adds_a_node_to_the_head_of_an_empty_binary_tree
    @new_list.insert("d")
    assert_equal "d", @new_list.head.data
    assert_equal NullNode::DEFAULT, @new_list.head.left
    assert_equal NullNode::DEFAULT, @new_list.head.right
  end

  def test_insert_method_adds_a_node_to_the_left_of_a_larger_node
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("a")
    assert_equal "b", @new_list.head.left.data
    assert_equal "a", @new_list.head.left.left.data
  end

  def test_insert_method_adds_a_node_to_the_right_of_a_smaller_node
    @new_list.insert("d")
    @new_list.insert("f")
    @new_list.insert("g")
    assert_equal "f", @new_list.head.right.data
    assert_equal "g", @new_list.head.right.right.data
  end

  def test_include_method_verifies_or_rejects_the_presence_of_a_value
    @new_list.insert("d")
    @new_list.insert("f")
    assert @new_list.include?("d")
    assert @new_list.include?("f")
    refute @new_list.include?("s")
  end

  def test_depth_of_method_returns_depth_of_given_node_value
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("a")
    assert_equal 0, @new_list.depth_of("d")
    assert_equal 1, @new_list.depth_of("b")
    assert_equal 2, @new_list.depth_of("a")
  end

  def test_maximum_value_of_an_empty_tree_is_nil
    assert_equal nil, @new_list.maximum
  end

  def test_find_the_maximum_value_in_the_tree
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("f")
    assert_equal "f", @new_list.maximum
  end

  def test_minimum_value_of_an_emoty_tree_is_nil
    assert_equal nil, @new_list.minimum
  end

  def test_find_the_minimum_value_in_the_tree
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("f")
    assert_equal "b", @new_list.minimum
  end

  def test_return_array_of_the_values_in_sorted_order
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("a")
    @new_list.insert("c")
    @new_list.insert("f")
    @new_list.insert("e")
    @new_list.insert("g")
    assert_equal ["a", "b", "c", "d", "e", "f", "g"], @new_list.sort
  end

  def test_number_of_leaves_returns_0_on_a_tree_with_no_nodes
    assert_equal 0, @new_list.number_of_leaves
  end

  def test_returns_number_of_leaves_returns_1_on_a_tree_with_one_node
    @new_list.insert("d")
    assert_equal 1, @new_list.number_of_leaves
  end

  def test_number_of_leaves_returned_on_a_tree_with_multiple_nodes
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("f")
    assert_equal 2, @new_list.number_of_leaves
  end

  def test_return_height_of_tree_as_negative_one_if_empty
    assert_equal -1, @new_list.height
  end

  def test_return_height_of_tree_as_zero_if_just_has_one_node
    @new_list.insert("d")
    assert_equal 0, @new_list.height
  end

  def test_return_height_of_tree_with_multiple_nodes
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("a")
    assert_equal 2, @new_list.height
  end

  def test_delete_a_node_with_no_children
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("f")
    @new_list.delete("f")
    refute @new_list.include?("f")
    assert_equal NullNode::DEFAULT, @new_list.head.right
  end

  def test_delete_a_node_with_one_child
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("a")
    @new_list.delete("b")
    refute @new_list.include?("b")
    assert_equal "a", @new_list.head.left.data
  end

  def test_delete_a_node_with_two_children
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("f")
    @new_list.delete("d")
    refute @new_list.include?("d")
    assert_equal "b", @new_list.head.data
  end

  def test_returns_the_children_type_of_a_node
    @new_list.insert("d")
    @new_list.insert("b")
    @new_list.insert("f")
    here = @new_list.head
    assert_equal "Both", @new_list.children_type(here)
  end
end
