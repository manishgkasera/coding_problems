require 'spec_helper'
require 'linked_list'

describe LinkedList do
  subject(:ll){LinkedList.new}

  describe 'add_node' do
    it 'should add a node to empty list' do
      ll.should be_empty
      ll.add_node(2)
      ll.head.data.should eq(2)
      ll.head.nxt.should be_nil
    end

    it 'should add a node to single node list' do
      ll.add_node(2)
      ll.add_node(3)
      ll.head.nxt.data.should eq(3)
      ll.head.nxt.nxt.should be_nil
    end

    it 'should add a node to multi node list' do
      ll.add_node(2)
      ll.add_node(3)
      ll.add_node(4)
      ll.head.nxt.nxt.data.should eq(4)
      ll.head.nxt.nxt.nxt.should be_nil
    end

    it 'should add a node after deliting the same node' do
      ll.add_node(2)
      ll.delete_node(2)
      ll.add_node(2)
      ll.head.data.should eq(2)
    end
  end

  describe 'delete_node' do
    it 'should do nothing for empty list' do
      ll.delete_node(2)
      ll.should be_empty
    end

    it 'should do nothing for non existing node' do
      ll.add_node(3)
      ll.delete_node(4)
      ll.head.should eq(LinkedList::Node.new(3))
    end

    it 'should delete head from a single node list' do
      ll.add_node(2)
      ll.delete_node(2)
      ll.head.should be_nil
    end

    it 'should delete head from a multi node list' do
      ll.add_node(2).add_node(3)
      ll.delete_node(2)
      ll.head.data.should eq(3)
      ll.head.nxt.should be_nil
    end

    it 'should delete a node from midle of the list' do
      ll.add_node(2).add_node(3).add_node(4)
      ll.delete_node(3)
      ll.head.nxt.data.should eq(4)
      ll.head.nxt.nxt.should be_nil
    end

    it 'should delete a node from end of the list' do
      ll.add_node(2).add_node(3).add_node(4)
      ll.delete_node(4)
      ll.head.nxt.data.should eq(3)
      ll.head.nxt.nxt.should be_nil
    end
  end

  describe 'revesal' do
    it 'should do nothing for empty list' do
      ll.reverse!
      ll.should be_empty
    end

    it 'should do nothing for one node list' do
      ll.add_node(2).reverse!
      ll.head.data.should eq(2)
      ll.head.nxt.should be_nil
    end

    it 'should reverse multi node list' do
      1.upto(10){|i| ll.add_node(i)}
      ll.reverse!
      ll.nodes.map(&:data).should eq((1..10).to_a.reverse)
    end
  end

  describe 'delete_every_nth' do
    it 'should do nothing for empty list' do
      ll.delete_every_nth(1)
      ll.should be_empty
    end

    it 'should delete head for n=1 and single node list' do
      ll.add_node(5).delete_every_nth(1)
      ll.should be_empty
    end

    it 'should do nothing for n!=1 and single node list' do
      ll.add_node(2)
      ll.delete_every_nth(3)
      ll.head.data.should eq(2)
      ll.head.nxt.should be_nil
    end

    it 'should do nothing for n < 1' do
      1.upto(5){|i| ll.add_node(i)}
      ll.delete_every_nth(0)
      ll.nodes.map(&:data).should eq((1..5).to_a)
    end

    it 'should delete last from 2 node list for n=2' do
      ll.add_node(2).add_node(3)
      ll.delete_every_nth(2)
      ll.head.nxt.should be_nil
    end

    it 'should delete every node from list for n=1' do
      1.upto(5){|i| ll.add_node(i)}
      ll.delete_every_nth(1)
      ll.should be_empty
    end

    it 'should delete every 2nd node from list for n=2' do
      1.upto(5){|i| ll.add_node(i)}
      ll.delete_every_nth(2)
      ll.nodes.map(&:data).should eq([1,3,5])
    end

    it 'should delete every 3rd node from list for n=3' do
      1.upto(6){|i| ll.add_node(i)}
      ll.delete_every_nth(3)
      ll.nodes.map(&:data).should eq([1,2,4,5])
    end
  end
end