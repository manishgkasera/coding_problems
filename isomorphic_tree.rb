class Tree
  attr_accessor :head

  def initialize(data=nil)
    @head = Node.new(data) if data
  end

  def self.isomorphic?(t1, t2)
    return true if t1.head.nil? && t2.head.nil?
    return false if (t1.head && !t2.head) || (!t1.head && t2.head)
    return false if t1.head.data != t2.head.data

    h1 = t1.height
    h2 = t2.height
    return false if h1 != h2

    2.upto(h1) do |h|
      return false if(t1.nodes_at_height(h).map(&:data).sort != t2.nodes_at_height(h).map(&:data).sort)
    end
    return true
  end

  def nodes_at_height(h)
    if head && h > 0
      return [head] if h == 1
      if head.left && head.right
        [head] + head.left.nodes_at_height(h-1) + head.right.nodes_at_height(h-1)
      elsif head.left
        [head] + head.left.nodes_at_height(h-1)
      else
        [head] + head.right.nodes_at_height(h-1)
      end
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
      @head = Node.new(d)
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

  class Node
    attr_accessor :data, :left, :right

    def initialize(data, left=nil, right=nil)
      @data, @left, @right = data, left, right
    end
  end
end

if defined?(describe)
  describe Tree do
    describe 'isomorphism' do
      it 'should work for empty trees' do
        t1, t2 = Tree.new, Tree.new
        Tree.isomorphic?(t1,t2).should == true
      end

      it 'should work for single node trees' do
        t1, t2 = Tree.new, Tree.new
        t1.add_node(2)
        t2.add_node(2)
        Tree.isomorphic?(t1,t2).should == true
      end

      it 'should not work for single node trees with diffrent data' do
        t1, t2 = Tree.new, Tree.new
        t1.add_node(2)
        t2.add_node(3)
        Tree.isomorphic?(t1,t2).should == false
      end

      it 'should work for two level trees' do
        t1, t2 = Tree.new(2), Tree.new(2)
        t1.head.left = Tree.new(3)
        t2.head.right = Tree.new(3)
        Tree.isomorphic?(t1,t2).should == true
      end

      it 'should not work for two level trees with diffrent data' do
        t1, t2 = Tree.new(2), Tree.new(2)
        t1.head.left = Tree.new(3)
        t2.head.right = Tree.new(4)
        Tree.isomorphic?(t1,t2).should == false
      end

      it 'should not work for diffrent height trees' do
        t1, t2 = Tree.new(2), Tree.new
        t1.add_node(3)
        Tree.isomorphic?(t1,t2).should == false
      end
    end
  end
end