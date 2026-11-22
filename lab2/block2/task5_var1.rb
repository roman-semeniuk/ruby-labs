matrix = [
  [5, 1, 9, 4],
  [2, 8, 3, 7],
  [6, 2, 1, 0],
  [4, 4, 7, 3]
]

puts "Two-dimensional array of numbers:"
for row in matrix
  puts row.inspect
end

keys = []
for i in 0...matrix.length
  keys[i] = matrix[i][i]
end

n = matrix.length
for k in 0...n - 1
  for j in 0...n - 1 - k
    if keys[j] > keys[j + 1]
      keys[j], keys[j + 1] = keys[j + 1], keys[j]
      matrix[j], matrix[j + 1] = matrix[j + 1], matrix[j]
    end
  end
end

puts "\nProcessed array:"
for row in matrix
  puts row.inspect
end