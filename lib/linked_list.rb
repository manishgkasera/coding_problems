class LinkedList
  attr_accessor :head

  def initialize(d=nil)
    @head = Node.new(d) if d
  end

  def add_node(d)
    new_node = Node.new(d)
    if head
      last_node = head
      while(last_node.nxt)
        last_node = last_node.nxt
      end
      last_node.nxt = new_node
    else
      self.head = new_node
    end
    self
  end

  def delete_node(d)
    if head
      if head.data == d
        self.head = head.nxt
      else
        prev = head
        node = head.nxt
        while(node && node.data != d)
          prev = node
          node = node.nxt
        end
        prev.nxt = node.nxt if node
      end
    end
    self
  end

  def delete_every_nth(n)
    if head && n > 0
      if n == 1
        self.head = nil
      else
        prev  = head
        node  = head.nxt
        count = 2
        while node
          if count % n == 0
            prev.nxt = node.nxt
          else
            prev = node
          end
          node = node.nxt
          count += 1
        end
      end
    end
    self
  end

  def reverse!
    if head
      cur = head
      nxt = head.nxt
      head.nxt = nil
      while nxt
        new_nxt = nxt.nxt
        nxt.nxt = cur
        cur = nxt
        nxt = new_nxt
      end
      self.head = cur
    end
    self
  end

  def nodes
    nodes = []
    node = head
    while node
      nodes << node
      node = node.nxt
    end
    nodes
  end

  def empty?
    head.nil?
  end

  def display
    if head
      print head.data
      nxt = head.nxt
      while(nxt)
        print '->'
        print nxt.data
        nxt = nxt.nxt
      end
    end
  end

  class Node
    attr_accessor :data, :nxt
    def initialize(d, nxt=nil)
      @data, @nxt = d, nxt
    end

    def ==(other)
      !other.nil? && self.data == other.data && self.nxt == other.nxt
    end
  end
end