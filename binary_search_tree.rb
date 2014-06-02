require 'pry'

class Node
  attr_accessor :left_child, :right_child
  attr_reader :value

  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end

end

class Tree
  attr_reader :head

  def build_tree(array)
    mid_point = array.length/2
    @head = Node.new(array[mid_point])
    left = array[0...mid_point]
    right = array[(mid_point + 1)..-1]
    if left.length > 0
      @head.left_child = _build_tree(left)
    end

    if right.length > 0
      @head.right_child = _build_tree(right)
    end

  end

  def _build_tree(array)
    if array.length != 1
      mid_point = array.length/2
      left = array[0...mid_point]
      right = array[(mid_point + 1)..-1]
      node = Node.new(array[mid_point])
      if left.length > 0
        node.left_child = _build_tree(left)
      end

      if right.length > 0
        node.right_child = _build_tree(right)
      end
      return node
    else
      return Node.new(array[0])
    end

  end

  def include?(number)
    _include?(number, @head)
  end

  def _include?(number, current_node)
    return true if number == current_node.value
    if number < current_node.value
      return false if current_node.left_child.nil?
      _include?(number, current_node.left_child)
    else
      return false if current_node.right_child.nil?
      _include?(number, current_node.right_child)
    end
  end


end

tree = Tree.new
tree.build_tree([1,2,3,4,5,6, 7, 8, 9, 10])
tree.head
tree.head.left_child
tree.head.right_child
binding.pry
p tree

