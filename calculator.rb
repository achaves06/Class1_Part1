#SIMPLE CALCULATOR
require 'pry'

def get_num
  puts "\nEnter a number"
  num = gets.chomp
  while !is_num(num) #check that input is a number, otherwise prompt error and request a number
    puts "\nYour input #{num} was not a number. Please enter a number. To quit enter 'quit'"
    num = gets.chomp
    exit if num.downcase == 'quit'
  end
  num.to_f
end

#method to check if entered value is numeric
def is_num(num)
  #First convert num to float or integer . If it is not a number, result will be 0.0. Convert that back in to string to confirm that it matches
  num.to_f.to_s == num || num.to_i.to_s == num
end

def get_operation
  puts "\nSelect the operation to be performed. Enter the corresponding number from the following list: \n 1) Add\n 2) Subtract\n 3) Multiply\n 4) Divide"
  operation = gets.chomp
  valid = [*?1..?4].include? operation
  while !valid
    puts "Your entry was invalid, please enter 1,2,3,4. To quit enter 'quit' \n 1) Add\n 2) Subtract\n 3) Multiply\n 4) Divide"
    operation = gets.chomp
    exit if operation == 'quit'
    valid = [*?1..?4].include? operation
  end
  operation
end

def calculate(operation,num1,num2)
  skip = false
  case operation
  when "1"
    symbol = "+"
    result = num1 + num2
  when "2"
    symbol = '-'
    result = num1 - num2
  when "3"
    symbol = "x"
    result = num1 * num2
  when "4"
    symbol = "/"
    if num2 != 0
    result = num1 / num2
    else
    puts "Error - Division by zero is not defined"
    result = 0
    end
  else
    puts "We were unable to identify your requested operation"
    skip = true
  end
  puts result(num1,num2, symbol, result) if !skip
  result
end

def result(num1,num2,symbol,result)
  "#{num1} #{symbol} #{num2} = #{result}"
end

def check_proceed
  puts "To exit enter 'quit' enter anything else to continue"
  exit if gets.chomp == "quit"
end

def check_clear(result_num)
  puts "To clear the calculator enter 'clear', press any other key to use the last result: #{result_num}"
  return gets.chomp == 'clear'
end

#Begin calculator operations

#initiate values prompt = false so user doesn't get asked if calculator needs to be cleared. result_num is 0 since there are no results yet
prompt = false
result_num = 0
loop do
   # asign 0 to the result if it doesn't currently have a value
  prompt ? clear = check_clear(result_num) : clear = true # by default prompt will be false so user won't be asked to clear the calculator. Once user has looped through at one or more cycle, calculator will prompt for clear command.
  clear ? num1 = get_num : num1 = result_num #if the user does not clear the calculator, assign the value in the last result to num_1, otherwise ask for num 1 ---On the first run, the calculator will always ask for num1
  operation = get_operation
  num2 = get_num
  result_num = calculate(operation,num1,num2).to_f
  check_proceed
  prompt = true
end
