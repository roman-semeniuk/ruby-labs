puts "Task 1: Create courses hash"
courses = {
  "Ruby on Rails" => 4500,
  "Python Data Science" => 5200,
  "JavaScript Basics" => 3000,
  "DevOps & Docker" => 6000,
  "Machine Learning" => 7500,
  "Cybersecurity" => 4800,
  "UI/UX Design" => 3500,
  "Flutter Mobile" => 5000,
  "AWS Cloud" => 6500,
  "SQL Databases" => 0
}

courses.each do |name, price|
  puts "#{name} -> #{price} грн"
end

puts "\nTask 2: Convert to indexed array"
indexed_courses = courses.to_a
indexed_courses.each_with_index do |item, index|
  puts "Index #{index}: #{item[0]} => #{item[1]} грн"
end

puts "\nTask 3: Sort courses"
puts "Choose sorting option: 1 - by name, 2 - by price"
print "Your choice: "
sort_choice = gets.chomp.to_i

if sort_choice == 1
  sorted_courses = courses.sort_by { |name, price| name.downcase }.to_h
  sorted_courses.each do |name, price|
    puts "#{name} -> #{price} грн"
  end
elsif sort_choice == 2
  sorted_courses = courses.sort_by { |name, price| price }.to_h
  sorted_courses.each do |name, price|
    puts "#{name} -> #{price} грн"
  end
else
  puts "Invalid choice."
end

puts "\nTask 4: 3 courses with shortest names"
shortest_courses = courses.min_by(3) { |name, price| name.length }
shortest_courses.each do |name, price|
  puts "#{name} (#{name.length} chars) -> #{price} грн"
end

puts "\nTask 5: 5 cheapest courses with non-zero price"
cheapest_courses = courses.select { |name, price| price > 0 }.min_by(5) { |name, price| price }
cheapest_courses.each do |name, price|
  puts "#{name} -> #{price} грн"
end

puts "\nTask 6: Search course by name"
print "Enter course name to search: "
search_name = gets.chomp

if courses.key?(search_name)
  puts "Course '#{search_name}' found. Price: #{courses[search_name]} грн"
else
  puts "Course '#{search_name}' not found."
end

puts "\nTask 7: Total cost of courses"
total_cost = courses.values.sum
puts "Total cost: #{total_cost} грн"

puts "\nTask 8: Check and update zero or missing prices"
courses.each do |name, price|
  if price.nil? || price == 0
    print "Course '#{name}' has price #{price}. Enter new price: "
    suggested_price = gets.chomp.to_i
    if suggested_price > 0
      courses[name] = suggested_price
    else
      puts "Invalid new price. Price unchanged."
    end
  end
end

puts "\nUpdated courses list:"
courses.each do |name, price|
  puts "#{name} -> #{price} грн"
end