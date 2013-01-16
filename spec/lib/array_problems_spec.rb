require 'spec_helper'
require 'array_problems'

describe ArrayProblems do
  describe 'merge_sorted' do
    it 'should merge two empty arrays' do
      ArrayProblems.merge_sorted([], []).should eq([])
    end

    it 'should merge one empty array with sorted' do
      a2 = (1..5).to_a
      ArrayProblems.merge_sorted([], a2).should eq(a2.clone)
    end

    it 'should merge sorted array with empty array' do
      a1 = (1..5).to_a
      ArrayProblems.merge_sorted(a1, []).should eq(a1.clone)
    end

    it 'should merge length 1 arrays' do
      ArrayProblems.merge_sorted([2], [1]).should eq([1,2])
    end

    it 'should merge two non empty arrays' do
      a1 = [1,4,7,9]
      a2 = [2,3,10]
      ArrayProblems.merge_sorted(a1, a2).should eq([1,2,3,4,7,9,10])
    end

    it 'should merge two non empty arrays with common elements' do
      a2 = [1,4,7,9]
      a1 = [1,2,9]
      ArrayProblems.merge_sorted(a1,a2).should eq([1,1,2,4,7,9,9])
    end

    it 'should merge two non empty arrays with negative elements' do
      a2 = [-4,1,7,9]
      a1 = [-9,1,2]
      ArrayProblems.merge_sorted(a1,a2).should eq([-9,-4,1,1,2,7,9])
    end
  end

end