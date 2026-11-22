matrix = [
  [1, 3, 5, 7, 9],
  [8, 2, 9, 1, 4],
  [2, 4, 6, 8, 10]
]

puts "Two-dimensional array of numbers:"
matrix.each { |row| puts row.inspect }

matrix.map! do |row|
  if row == row.sort
    row.reverse
  else
    row.shuffle
  end
end

puts "\nProcessed array:"
matrix.each { |row| puts row.inspect }