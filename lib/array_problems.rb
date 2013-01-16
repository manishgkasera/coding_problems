class ArrayProblems
  class << self
    #Given two sorted arrays merge them into single array
    def merge_sorted(a1, a2)
      return a1 if a2.empty?
      return a2 if a1.empty?
      a = []
      i = 0; j = 0
      while(i<a1.length && j<a2.length)
        if a1[i] <= a2[j]
          a << a1[i]
          i+=1
        else
          a << a2[j]
          j+=1
        end
      end
      a += a1[i..-1] if i < a1.length
      a += a2[j..-1] if j < a2.length
      a
    end

    #Given an array, find all the pairs of elements whose sum is k
    def find_pairs_with_given_sum(a, sum)
      result = []
      hash = Hash[a.product([true])]
      a.each do |e|
        result << [e, sum-e] if hash[sum-e]
      end
      result
    end
  end
end