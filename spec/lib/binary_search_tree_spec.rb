require 'spec_helper'
require 'binary_search_tree'

describe BST do

  describe 'add_node' do
    subject(:tree) {BST.new(0)}

    it 'should add a left node for less value than head' do
      tree.add_node(-1)
      tree.right.should be_nil
      tree.left.data.should eq(-1)
    end

    it 'should add a right node for higher value than head' do
      tree.add_node(1)
      tree.left.should be_nil
      tree.right.data.should eq(1)
    end

    it 'should add a left node to a left node for less value than head and left node' do
      tree.add_node(-1).add_node(-2)
      tree.left.right.should be_nil
      tree.left.left.data.should eq(-2)
    end

    it 'should add a right node to the left node of head for value lower than head but higher than left to head' do
      tree.add_node(-2).add_node(-1)
      tree.right.should be_nil
      tree.left.data.should eq(-2)
      tree.left.left.should be_nil
      tree.left.right.data.should eq(-1)
    end
  end

  describe 'delete_node' do
    subject(:tree) do
      t = BST.new(0).add_node(-10).add_node(-20).add_node(-5)
      t.add_node(10).add_node(20).add_node(5)
    end

    it 'should delete head from single node tree' do
      t = BST.new(0)
      t.delete_node(0)
      t.should be_nil
    end

    it 'should delete head' do
      tree.delete_node(0)
    end
    it 'should delete leaf'
    it 'should delete middle node'
  end
end