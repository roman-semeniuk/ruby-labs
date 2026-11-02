loop do
  print "Enter numbers separated by space ('end' to exit): "
  input = gets.chomp
  break if input == "end"

  numbers = input.split
  sum = 0
  for i in 0...numbers.length
    if i % 2 == 1
      sum += numbers[i].to_i
    end
  end
  puts "Sum of elements at odd indexes: " + sum.to_s
end