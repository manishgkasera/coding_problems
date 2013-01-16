class EvalExpr
  def self.evaluate(expr)
    return if expr == '' || expr.nil?
    stack = []
    expr.to_s.each_char do |c|
      case c
      when ' ', "\t"
        next
      when '(', '+', '-', '*', '/', c.to_i.to_s
        stack.push c
      when ')'
        v2 = pop_from_stack(stack)
        op = pop_from_stack(stack)
        v1 = pop_from_stack(stack)

        if op == '/' && v2.to_i == 0
          puts 'Error: cannot divide by zero'
          return
        end
        pop_from_stack(stack)
        stack.push eval("#{v1} #{op} #{v2}")
      else
        puts 'Error: unknown char: ' + c
        return
      end
    end

    value = pop_from_stack(stack)
    while(op = pop_from_stack(stack))
      value = eval("#{pop_from_stack(stack)} #{op} #{value}")
    end
    value.to_i
  end

  def self.pop_from_stack(stack)
    c = stack.pop
    if ['+', '-', '*', '/'].index(c).nil?
      last_el = stack.last
      while(last_el.to_i.to_s == last_el)
        c = stack.pop + c
        last_el = stack.last
      end
    end
    c
  end
end

if defined?(describe)
  describe EvalExpr do
    it 'should do nothing for nil' do
      EvalExpr.evaluate('').should == nil
    end

    it 'should eval an integer' do
      EvalExpr.evaluate('20').should == 20
    end

    it 'should eval an expr with brackets' do
      EvalExpr.evaluate('(20 + 3)').should == 23
    end

    it 'should eval an nested expr with brackets' do
      EvalExpr.evaluate('(20 + (3*4))').should == 32
    end

    it 'should give nil if divide by 0' do
      EvalExpr.evaluate('(20 + (3/0))').should == nil
    end
  end
end