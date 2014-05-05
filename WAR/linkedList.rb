class LinkedList
  attr_reader :front, :back
  def initialize
    @front = nil
    @back = nil
  end

  def add(node, position)
    if @front == nil && @back == nil
      @front = node
      @back = node
    elsif position == :front
      node.in_back = @front
      @front.in_front = node
      @front = node
    else
      node.in_front = @back
      @back.in_back = node
      @back = node
    end
  end

  def remove(position)
    if @front == nil && @back == nil
      nil
    elsif @back == @front
      @back = nil
      @front = nil
    elsif position == :front
      @front = @front.in_back
      @front.in_front.in_back = nil
      @front.in_front = nil
    elsif position == :back
      @back = @back.in_front
      @back.in_back.in_front = nil
      @back.in_back = nil
    end
  end
end

class Node
  attr_accessor :in_front, :in_back
  attr_reader :value
  def initialize(value)
    @value = value
    @in_front = nil
    @in_back = nil
  end
end

