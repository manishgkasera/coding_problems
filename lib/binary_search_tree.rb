require_relative 'tree.rb'

class BST < Tree

  def initialize(d=nil)
    @head = Node.new(d) if d
  end

  def add_node(d)
    if head
      if d <= head.data
        left.add_node(d)
      else
        right.add_node(d)
      end
    else
      self.head = Node.new(d)
    end
    self
  end

  def delete_node(d)
    if head
      if d == head.data
        #make right node the new head
        if !left.nil?
          if !right.nil? && !right.left.nil?
            tmp = left
            while !tmp.right.nil?
              tmp = tmp.right
            end
            tmp.right = right.left
          else
            right.left = left
          end
        end
        self.head = right
      elsif d < head.data
        left.delete_node(d)
      else
        right.delete_node(d)
      end
    end
    self
  end

  def largest(n=1)
    inorder[n*-1]
  end

  class Node
    attr_accessor :data, :left, :right

    def initialize(data, left=BST.new, right=BST.new)
      @data, @left, @right = data, left, right
    end
  end
end