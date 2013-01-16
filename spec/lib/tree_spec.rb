require 'spec_helper'
require 'tree'

describe Tree do
  subject(:tree) do
    Tree.new
  end

  describe 'add_node' do
    it 'should add a head to empty tree' do
      tree.add_node(2)
      tree.data.should eq(2)
      tree.height.should eq(1)
    end

    it 'should add a node to non empty tree' do
      tree = Tree.new(3)
      tree.height.should eq(1)
      tree.add_node(2)
      tree.height.should eq(2)
    end
  end

  describe 'height' do
    it 'should be zero for null tree' do
      Tree.new.height.should == 0
    end

    it 'should be 1 for single node tree' do
      Tree.new(2).height.should == 1
    end

    it 'should be 2 for two node tree' do
      t = Tree.new(2).add_node(4)
      t.height.should == 2
    end

    it 'should be 2 for three node(h,l,r) tree' do
      t = Tree.new(2)
      t.left = Tree.new(3)
      t.right = Tree.new(4)
      t.height.should == 2
    end

    it 'should be 3 for three node(h,l,l) tree' do
      t = Tree.new(2)
      t.left = Tree.new(3).add_node(4)
      t.height.should == 3
    end
  end

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
      t1.left = Tree.new(3)
      t2.right = Tree.new(3)
      Tree.isomorphic?(t1,t2).should == true
    end

    it 'should not work for two level trees with diffrent data' do
      t1, t2 = Tree.new(2), Tree.new(2)
      t1.left = Tree.new(3)
      t2.right = Tree.new(4)
      Tree.isomorphic?(t1,t2).should == false
    end

    it 'should not work for diffrent height trees' do
      t1, t2 = Tree.new(2), Tree.new
      t1.add_node(3)
      Tree.isomorphic?(t1,t2).should == false
    end
  end
end