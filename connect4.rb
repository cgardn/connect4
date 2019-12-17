require './lib/board.rb'

def do_turn(player, board)
  board.show_board
  puts "Player #{player}, choose a column to drop a piece in!"
  new_piece = gets.chomp.to_i - 1
  while new_piece < 0 or new_piece > 6
    board.show_board
    puts "Please select from 1-7"
    new_piece = gets.chomp.to_i - 1
  end

  r = board.add_piece(player, new_piece)
  while r != 1
    puts "Sorry, that column is full! Please choose another"
    new_piece = gets.chomp.to_i + 1
    r = board.add_piece(player, new_piece)
  end

  w = board.check_win
  if w != nil
    board.show_board
    puts "Player #{player} wins!"
    exit
  end
end

current_player = 1
next_player = 2
board = Board.new
while 1
  do_turn(current_player, board)
  current_player, next_player = next_player, current_player
end
