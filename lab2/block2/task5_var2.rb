matrix = [
  [5, 1, 9, 4],
  [2, 8, 3, 7],
  [6, 2, 1, 0],
  [4, 4, 7, 3]
]

puts "Two-dimensional array of numbers:"
matrix.each { |row| puts row.inspect }

pairs = []
matrix.each_with_index do |row, i|
  pairs << [row[i], row]
end

pairs.sort!
result = pairs.map { |key, row| row }

puts "\nProcessed array:"
result.each { |row| puts row.inspect }