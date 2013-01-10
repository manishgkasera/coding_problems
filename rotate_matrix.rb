require 'scanf'
class RotateMatrix
  attr_accessor :matrix, :d
  def initialize(d)
    @matrix = Array.new(d){Array.new(d)}
    @d = d
  end

  def levels(dim=d)
    return 0 if dim == 1
    return 1 if dim == 2
    levels(dim-2) + 1
  end

  def rotate(x=0,dim=d)
    puts "Rotate: x=#{x}, dim=#{dim}"
    return if x >= dim
    if x.even?
      t = matrix[x+1][x]
      x.upto(x+dim-1) do |i|
        t1 = matrix[x][i]
        matrix[x][i] = t
        t = t1
      end

      (x+1).upto(x+dim-1) do |i|
        t1 = matrix[i][x+dim-1]
        matrix[i][x+dim-1] = t
        t = t1
      end

      (dim-1).downto(1) do |i|
        i = x + i - 1
        t1 = matrix[x+dim-1][i]
        matrix[x+dim-1][i] = t
        t = t1
      end

      (dim-2).downto(1) do |i|
        i = x + i
        t1 = matrix[i][x]
        matrix[i][x] = t
        t = t1
      end
    else
      t = matrix[x][x+1]
      x.upto(x+dim-1) do |i|
        t1 = matrix[i][x]
        matrix[i][x] = t
        t = t1
      end

      (x+1).upto(x+dim-1) do |i|
        t1 = matrix[x+dim-1][i]
        matrix[x+dim-1][i] = t
        t = t1
      end

      (dim-1).downto(1) do |i|
        i = x + i - 1
        t1 = matrix[i][x+dim-1]
        matrix[i][x+dim-1] = t
        t = t1
      end

      (dim-2).downto(1) do |i|
        i = x + i
        t1 = matrix[x][i]
        matrix[x][i] = t
        t = t1
      end
    end

    rotate(x+1, dim-2)
    self
  end

  def print
    puts self.inspect
    matrix.each do |sm|
      puts sm.join(' ')
    end
  end
end


n=scanf('%d').first
m=RMatrix.new n
n.times do |i|
  scanf(Array.new(n){'%d'}.join(' ')).each_with_index do |e, j|
    m.matrix[i][j] = e.to_i
  end
end
m.print
m.rotate.print