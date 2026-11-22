array = [1, 2, 3, 4, 5, 6]

product_of_even = 1
found_even = false

array.each do |num|
  if num.even?
    product_of_even *= num
    found_even = true
  end
end

puts "Array of numbers: #{array}"
if found_even
  puts "Product of even numbers of array: #{product_of_even}"
else
  puts "There are no even numbers in array."
end