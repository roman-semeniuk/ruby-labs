File.open("report.txt", "w") do |file|
  file.puts "REPORT"
  file.puts "Date: #{Time.now.strftime('%d.%m.%Y %H:%M')}"
  file.puts "-" * 20
  file.puts "Weekly sales: 120"
  file.puts "Returns: 5"
end

puts "Report written, file contents:"
puts File.read("report.txt")

saved_file = nil

begin
  File.open("report.txt", "w") do |file|
    saved_file = file
    file.puts "Line before the error"
    raise "Error inside the block"
    file.puts "This line will not be written"
  end
rescue => e
  puts "\nException caught: #{e.message}"
end

puts "Is the file closed? #{saved_file.closed?}"
puts "Contents after the error:"
puts File.read("report.txt")