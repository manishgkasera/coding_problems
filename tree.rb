class Tree
  attr_accessor :head

  def initialize(d=nil)
    @head = Node.new(d) if d
  end

  def add_node(d)
    if head
      if rand(2) == 0
        if head.left
          head.left.add_node(d)
        else
          head.left = Tree.new(d)
        end
      else
        if head.right
          head.right.add_node(d)
        else
          head.right = Tree.new(d)
        end
      end
    else
      head = Node.new(d)
    end
    self
  end

  def display(level=0)
    if head
      puts head.data
      if head.right
        puts '   '*level + '|'
        print '   '*level + 'R -> '
        head.right.display(level+1)
     end
      if head.left
        puts '   '*level + '|'
        print '   '*level + 'L -> '
        head.left.display(level+1)
      end
    end
  end

  def inorder
    if head
      head.left.inorder if head.left
      print head.data.to_s + ' '
      head.right.inorder if head.right
    end
  end

  def height
    if head
      if head.left && head.right
        1 + [head.left.height, head.right.height].max
      elsif head.left
        1 + head.left.height
      elsif head.right
        1 + head.right.height
      else
        1
      end
    else
      0
    end
  end

  def level_order
    if head
      1.upto(height) do |l|
        print_level(l)
        print "\n"
      end
    end
  end

  def print_level(l)
    if l == 1
      print head.data.to_s + ' '
    else
      head.left.print_level(l-1) if head.left
      head.right.print_level(l-1) if head.right
    end
  end

  class Node
    attr_accessor :data, :left, :right

    def initialize(data, left=nil, right=nil)
      @data, @left, @right = data, left, right
    end
  end
end