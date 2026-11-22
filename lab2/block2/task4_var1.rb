matrix = [
  [1, 3, 5, 7, 9],
  [8, 2, 9, 1, 4],
  [2, 4, 6, 8, 10]
]

puts "Two-dimensional array of numbers:"
for row in matrix
  puts row.inspect
end

for i in 0...matrix.length
  row = matrix[i]

  is_sorted = true
  for j in 0...row.length - 1
    if row[j] > row[j + 1]
      is_sorted = false
      break
    end
  end

  if is_sorted
    matrix[i] = row.reverse
  else
    matrix[i] = row.shuffle
  end
end

puts "\nProcessed array:"
for row in matrix
  puts row.inspect
end