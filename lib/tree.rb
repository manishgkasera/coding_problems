class Tree
  attr_accessor :head

  def initialize(d=nil)
    @head = Node.new(d) if d
  end

  def add_node(d)
    if head
      if rand(2) == 0
        left.add_node(d)
      else
        right.add_node(d)
      end
    else
      self.head = Node.new(d)
    end
    self
  end

  def inorder
    if head
      left.inorder + [head.data] + right.inorder
    else
      []
    end
  end

  def level_order
    if head
      (1..height).inject([]) do |nodes, l|
        nodes + nodes_at_level(l).map(&:data)
      end
    else
      []
    end
  end

  def nodes_at_level(l)
    if l == 1
      head ? [head] : []
    else
      left.nodes_at_level(l-1) + right.nodes_at_level(l-1)
    end
  end

  def height
    if head
      1 + [left.height, right.height].max
    else
      0
    end
  end

  def display(level=0)
    if head
      puts data
      if right.head
        puts '   '*level + '|'
        print '   '*level + 'R -> '
        right.display(level+1)
      end
      if left.head
        puts '   '*level + '|'
        print '   '*level + 'L -> '
        left.display(level+1)
      end
    end
  end

  def self.isomorphic?(t1, t2)
    return true if t1.head.nil? && t2.head.nil?
    return false if (t1.head && !t2.head) || (!t1.head && t2.head)

    h1 = t1.height
    h2 = t2.height
    return false if h1 != h2

    1.upto(h1) do |h|
      return false if(t1.nodes_at_level(h).map(&:data).sort != t2.nodes_at_level(h).map(&:data).sort)
    end
    return true
  end

  #delegate left,right,data and nil? to head
  def left; head.left; end
  def right; head.right; end
  def data; head.data; end

  def left=(tree); head.left=tree; end
  def right=(tree); head.right=tree; end
  def data=(d); head.data=d; end

  def nil?; head.nil?; end

  class Node
    attr_accessor :data, :left, :right

    def initialize(data, left=Tree.new, right=Tree.new)
      @data, @left, @right = data, left, right
    end
  end
end