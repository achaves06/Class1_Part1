#Draw Shapes Shape[0] = rock shape[1] = paper shape [2] scissors

#rock

require 'pry'

def get_user_selection
  puts "\nLet's play! Enter the number corresponding to one of the following options: \n \n1) Rock \n2) Paper \n3) Scissors\n"
  user_selection = gets.chomp
  while !([*?1..?3].include? user_selection)
    puts "\nYour entry was invalid. Please enter 1,2, or 3\n1) Rock \n2) Paper \n3) Scissors"
    user_selection = gets.chomp
  end
  user_selection
end

def compare_selections(user_selection, computer_selection)
  user_index = user_selection.to_i - 1
  computer_index = computer_selection.to_i - 1
  if user_selection == computer_selection
    result = "Draw"
    show_outcome(user_index,computer_index,result)
  else
    case computer_selection
    when "1" #Rock
      user_selection == "2" ? result = "You won!" : result = "You lost...."
      show_outcome(user_index,computer_index,result)
    when "2" #Paper
      user_selection == "3" ? result = "You won!" : result = "You lost...."
      show_outcome(user_index,computer_index,result)
    when "3" #Scissors
      user_selection == "1" ? result = "You won!" : result = "You lost...."
      show_outcome(user_index,computer_index,result)
    else
      puts "Oh Oh... We couldn't run the game"
    end
  end
end

def show_outcome(user_index,computer_index,result)
  shape = [[],[],[]]

  shape[0][0]='                 '
  shape[0][1]='    __ __ __     '
  shape[0][2]='   /        \    '
  shape[0][3]='  /          \   '
  shape[0][4]='  |          |   '
  shape[0][5]='   \         /   '
  shape[0][6]='    \__ __ _/    '
  shape[0][7]='                 '
  shape[0][8]='                 '
  shape[0][9]='                 '
  shape[0][10]='      ROCK       '

  #paper

  shape[1][0]='  ____________   '
  shape[1][1]=' |            |  '
  shape[1][2]=' |            |  '
  shape[1][3]=' |            |  '
  shape[1][4]=' |            |  '
  shape[1][5]=' |            |  '
  shape[1][6]=' |            |  '
  shape[1][7]=' |            |  '
  shape[1][8]=' |            |  '
  shape[1][9]=' |____________|  '
  shape[1][10]='     PAPER       '

  #Scissors
  shape[2][0]='   ___     ___  '
  shape[2][1]='  /   \   /   \ '
  shape[2][2]='  \___/   \___/ '
  shape[2][3]='    \ \   / /	'
  shape[2][4]='     \ \ / /	'
  shape[2][5]='      \ / /     '
  shape[2][6]='       /./      '
  shape[2][7]='      / / \     '
  shape[2][8]='     / / \ \    '
  shape[2][9]='     |/   \|    '
  shape[2][10]='    SCISSORS   '

  puts '   COMPUTER < --------------- >  YOU   '
  i = 0
  11.times do
     puts "#{shape[computer_index][i]}  #{shape[user_index][i]}"
     i += 1
   end
  puts result
end

def exit?
  puts "Enter 'quit' to exit or anything else to continue"
  exit if gets.chomp == "quit"
end

loop do
  user_selection = get_user_selection
  computer_selection = rand(1..3).to_s
  compare_selections(user_selection, computer_selection)
  exit?
end
