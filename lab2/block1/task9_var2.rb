array = [5, 2, 8, 2, 9, 2, 4]

min_val = array[0]
count = 0

array.each do |num|
  if num < min_val
    min_val = num
    count = 1
  elsif num == min_val
    count += 1
  end
end

puts "Array of numbers: #{array}"
puts "Minimum element of an array: #{min_val}"
puts "Number of minimum elements in an array: #{count}"