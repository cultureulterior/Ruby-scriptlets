#Ruby fixed point iterator

class Object
  def fixedpoint(memory_length=1)
    mem=[]
    mem << yield(self)
    while( !mem.include?(new=yield(mem[-1])) )
      mem.push(new)
      mem.shift if mem.length > memory_length
    end
    if memory_length==1
      mem[0]
    else
      mem
    end
  end
end
#
# Examples: 
#
# Test Collatz conjecture

p 3204923.fixedpoint(3){|o| if o%2==0 then o/2 else o*3+1 end }

# Compute square root of 5 with Newton-Raphson method

p 5.fixedpoint{|o| o-(((o**2)-5)/(2.0*o)) }
