loop do
  print "Enter a number to convert ('end' to exit): "
  input = gets.chomp
  break if input == "end"

  inputNumber = input.to_f
  if inputNumber % 1 == 0
    puts "Error: input isn't a float number."
  else
    percent = (inputNumber * 100).to_i
    puts percent.to_s + "%"
  end
end