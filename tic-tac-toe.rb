require 'pry'

#Tic Tac Toe grid
def draw_board(board)
  system "clear"
  puts "\n\n\n\n\n\n"
  puts " 1      |2        |3       "
  puts "   #{board[1]}    |    #{board[2]}    |    #{board[3]}    "
  puts "________|_________|________"
  puts " 4      |5        |6       "
  puts "   #{board[4]}    |    #{board[5]}    |    #{board[6]}    "
  puts "________|_________|________"
  puts "7       |8        |9       "
  puts "   #{board[7]}    |    #{board[8]}    |    #{board[9]}    "
  puts "        |         |        "
  puts "\n\n\n"
end

def initialize_board
  board = {}
  (1..9).each {|position| board[position]= ' '}
  board
end

def player_pick_square(board)
  puts "Select an available square from 1 to 9"
  selection = gets.chomp.to_i
  until empty_squares(board).include? selection
    puts "Your entry is not valid or has already been used. Please select an available square from 1-9"
    selection = gets.chomp.to_i
  end
  selection
end

def empty_squares(board)
  board.select {|key,value| value == ' ' }.keys
end

def computer_pick_square(board,strings_by_line)
  position = nil
  counts_by_line = total_counts_by_line(strings_by_line)
  counts_by_line.each do |line, count|
    if count[:user] == 0 && count[:computer] == 2 #computer can win then win
      square_index = strings_by_line[line].index(' ')
      position = WINNING_LINES[line][square_index]
      break
    elsif count[:user] == 2 && count[:computer] == 0 #block user
      square_index = strings_by_line[line].index(' ')
      position = WINNING_LINES[line][square_index]
    end
  end
  if position.nil? #nothing to win or block, then try to position to form a line
    counts_by_line.each do |line, count|
      if count[:user] == 0 && count[:computer] == 1 #computer can win then win
        square_index = strings_by_line[line].index(' ')
        position = WINNING_LINES[line][square_index]
        break
      elsif count[:user] == 0 && count[:computer] == 0 #block user
        square_index = strings_by_line[line].index(' ')
        position = WINNING_LINES[line][square_index]
      else
        position = empty_squares(board).sample
      end
    end
  end
   position
end

def convert_lines_to_string(board)
  strings_by_line = []
  WINNING_LINES.each_with_index do |line,index|
    line.each do |square|
      if strings_by_line[index].nil?
        strings_by_line[index] = board[square]
      else
        strings_by_line[index] = strings_by_line[index] + board[square]
      end
    end
  end
  strings_by_line
end

def total_counts_by_line(strings_by_line)
  counts_by_line = {}
  strings_by_line.each_with_index do |line,index|
    counts_by_line[index]= {user: line.scan("X").count,computer: line.scan("O").count}
  end
  counts_by_line
end

def find_winner(counts_by_line)
  #player wins
  counts_by_line.each do |line,value|
    if value[:computer] == 3
      puts "You lost...."
      exit
    elsif value[:user] == 3
      puts "You won!"
      exit
    end
  end
end


WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[1,5,9],[2,5,8],[3,6,9],[3,5,7]]
board = initialize_board
draw_board(board)
begin
  player_square = player_pick_square(board)
  board[player_square] = 'X'
  draw_board(board)
  strings_by_line = convert_lines_to_string(board)
  counts_by_line = total_counts_by_line(strings_by_line)
  find_winner(counts_by_line)
  position = computer_pick_square(board,strings_by_line)
  board[position]= 'O'
  draw_board(board)
  strings_by_line = convert_lines_to_string(board)
  counts_by_line = total_counts_by_line(strings_by_line)
  find_winner(counts_by_line)
end until empty_squares(board).empty?

puts "It's a tie"
