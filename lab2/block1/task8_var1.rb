array = [1, 2, 3, 4, 5, 6]

product_of_even = 1
found_even = false

for i in 0...array.length
  if array[i] % 2 == 0
    product_of_even *= array[i]
    found_even = true
  end
end

puts "Array of numbers: #{array}"
if found_even
  puts "Product of even numbers of array: #{product_of_even}"
else
  puts "There are no even numbers in array."
end