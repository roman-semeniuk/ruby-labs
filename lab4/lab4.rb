puts "Task 1: Default arguments and method redefinition"
def sum(a, b)
  return a + b
end
puts "Initial sum(10, 2): #{sum(10, 2)}"

def sum(a, b = 5)
  a + b
end
puts "Redefined sum(10, 2): #{sum(10, 2)}"
puts "Redefined sum(10) with default argument: #{sum(10)}"

puts "\nTask 2: Method with optional keyword parameters"
def greet(name:, age: nil, city: "Unknown")
  info = "Hello, #{name}!"
  info += " Age: #{age}." if age
  info += " City: #{city}."
  info
end
puts greet(name: "Roman")
puts greet(name: "Anna", age: 20)
puts greet(city: "Kyiv", name: "Andrew", age: 25)

puts "\nTask 3: Predicate methods"
def less_than_three?(x)
  x < 3
end

def positive_even?(number)
  number > 0 && number.even?
end

puts "less_than_three?(2): #{less_than_three?(2)}"
puts "less_than_three?(5): #{less_than_three?(5)}"
puts "positive_even?(4): #{positive_even?(4)}"
puts "positive_even?(-2): #{positive_even?(-2)}"

numbers = [1, 2, 3]
puts "Built-in predicate numbers.any?: #{numbers.any?}"
puts "Built-in predicate numbers.empty?: #{numbers.empty?}"

puts "\nTask 4: Operator methods and assignment methods"
class Bottle
  def capacity
    @capacity
  end

  def capacity=(new_cap)
    @capacity = new_cap
  end
end

class Broom
  def +(another)
    12 + another
  end
end

btl = Bottle.new
btl.capacity = 10
puts "Assignment method (btl.capacity = 10): #{btl.capacity}"

whisk = Broom.new
puts "Operator method + (whisk + 10): #{whisk + 10}"

puts "\nTask 5: Methods with array / splat arguments"
def sum_members(*members)
  initial = 0
  members.collect { |item| initial += item }
  initial
end

def multisum(a, b = 5, *c)
  sum = c.inject(0) { |acc, num| acc + num }
  sum * a * b
end

puts "sum_members(10, 2): #{sum_members(10, 2)}"
puts "sum_members(10, 2, 12, 34): #{sum_members(10, 2, 12, 34)}"

array_to_sum = [10, 2, 12, 34]
puts "sum_members(*array_to_sum): #{sum_members(*array_to_sum)}"
puts "multisum(5, *[1, 2, 3, 4, 5]): #{multisum(5, *[1, 2, 3, 4, 5])}"

puts "\nTask 6: Method alias"
def greet_baby
  "Hello, baby!"
end

alias baby greet_baby

puts "Original method greet_baby: #{greet_baby}"
puts "Alias baby: #{baby}"

puts "\nTask 7: Block methods with explicit argument (&blk)"
def test_block(n, m, &blk)
  for i in n..m
    blk.call(i)
  end
end

print "Result of test_block(3, 5): "
test_block(3, 5) { |i| print "#{i} ... " }
puts

puts "\nTask 8: Methods with yield (with and without arguments)"
def test1
  a = 1
  yield
end

def test2
  a = 1
  yield a
end

def safe_yield
  if block_given?
    yield
  else
    "No block given (safe call)"
  end
end

puts "test1 without yield argument:"
test1 { puts "Hello!" }

puts "test2 with yield argument:"
test2 { |x| puts ((2 + x).to_s + "hi") }

puts "safe_yield without block: #{safe_yield}"
puts "safe_yield with block: #{safe_yield { 'Block executed successfully' }}"

puts "\nTask 9: Proc without and with arguments"
simple_proc = Proc.new do
  "Your health!"
end
puts "simple_proc.call: #{simple_proc.call}"

args_proc = Proc.new { |a, b, c| [a, b, c] }
puts "Proc with fewer arguments (1, 2): #{args_proc.call(1, 2).inspect}"
puts "Proc with extra arguments (1, 2, 3, 4, 5): #{args_proc.call(1, 2, 3, 4, 5).inspect}"

def proc_return
  Proc.new { return "Proc.new return value" }.call
  return "proc_return method finished"
end
puts "proc_return: #{proc_return}"

puts "\nTask 10: Lambda without and with arguments"
simple_lambda = lambda { "Lambda called without arguments" }
puts simple_lambda.call

multiply = lambda { |x, y| x * y }
puts "multiply.call(2, 3): #{multiply.call(2, 3)}"

begin
  multiply.call(2)
rescue ArgumentError => e
  puts "Strict argument check (rescued): #{e.class} - #{e.message}"
end

def lambda_return
  lambda { return "lambda return value" }.call
  return "lambda_return method finished"
end
puts "lambda_return: #{lambda_return}"