loop do
  print "Enter element for the array separated by space ('end' to exit): "
  input = gets.chomp
  break if input == "end"

  array = input.split
  if array.empty?
    puts "Array is empty."
    next
  end
   uniqueElements = array.to_set.size

  puts "Number of unique elements in the input array: " + uniqueElements.to_s
end