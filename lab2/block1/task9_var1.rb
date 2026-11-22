array = [5, 2, 8, 2, 9, 2, 4]

min_val = array[0]
count = 1
i = 1

while i < array.length
  if array[i] < min_val
    min_val = array[i]
    count = 1
  elsif array[i] == min_val
    count += 1
  end

  i += 1
end

puts "Array of numbers: #{array}"
puts "Minimum element of an array: #{min_val}"
puts "Number of minimum elements in an array: #{count}"