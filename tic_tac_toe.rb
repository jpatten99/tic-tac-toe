class Tic_Tac_Toe
  PIECE1 = "x"
  PIECE2 = "o"
  def initialize
    @board = Array.new(3) { Array.new(3) { "-" } }
    @turn_counter = 0
    @game_not_over = true
  end
  def is_board_full?
    for i in 0..2 do
      for j in 0..2 do
        if @board[i][j] == "-"
          return false
        end
      end
    end
    return true
  end
  
  def input_valid?(input1, input2)
    if (input1 > 3 || input1 < 1) || (input2 > 3 || input2 < 1)
      return false
    else
      return true
    end
  end

  def print_board
    puts @board.map { |x| x.join(' ') }
    puts "\n"
  end

  def spot_not_taken?(x, y)
    return @board[y-1][x-1] == "-"
  end

  def add_piece(type, x, y)
      if input_valid?(x, y) && spot_not_taken?(x,y)
        @board[y-1][x-1] = type
        @turn_counter +=1
      end
  end

  def x_is_winner?
    #this is gonna be ugly it's getting late and i'm tired and can't think
    if ((@board[0][0] == PIECE1 && @board[0][1] == PIECE1 && @board[0][2] == PIECE1) || #row1
       (@board[1][0] == PIECE1 && @board[1][1] == PIECE1 && @board[1][2] == PIECE1) || #row2
       (@board[2][0] == PIECE1 && @board[2][1] == PIECE1 && @board[2][2] == PIECE1) || #row3
       (@board[0][0] == PIECE1 && @board[1][0] == PIECE1 && @board[2][0] == PIECE1) || #column1
       (@board[0][1] == PIECE1 && @board[1][1] == PIECE1 && @board[2][1] == PIECE1) || #column2
       (@board[0][2] == PIECE1 && @board[1][2] == PIECE1 && @board[2][2] == PIECE1) || #column3
       (@board[0][0] == PIECE1 && @board[1][1] == PIECE1 && @board[2][2] == PIECE1) || #diag1
       (@board[0][2] == PIECE1 && @board[1][1] == PIECE1 && @board[2][0] == PIECE1))    #diag2
        return true
    end
  end

  def o_is_winner?
    #this is gonna be ugly it's getting late and i'm tired and can't think
    if ((@board[0][0] == PIECE2 && @board[0][1] == PIECE2 && @board[0][2] == PIECE2) || #row1
       (@board[1][0] == PIECE2 && @board[1][1] == PIECE2 && @board[1][2] == PIECE2) || #row2
       (@board[2][0] == PIECE2 && @board[2][1] == PIECE2 && @board[2][2] == PIECE2) || #row3
       (@board[0][0] == PIECE2 && @board[1][0] == PIECE2 && @board[2][0] == PIECE2) || #column1
       (@board[0][1] == PIECE2 && @board[1][1] == PIECE2 && @board[2][1] == PIECE2) || #column2
       (@board[0][2] == PIECE2 && @board[1][2] == PIECE2 && @board[2][2] == PIECE2) || #column3
       (@board[0][0] == PIECE2 && @board[1][1] == PIECE2 && @board[2][2] == PIECE2) || #diag1
       (@board[0][2] == PIECE2 && @board[1][1] == PIECE2 && @board[2][0] == PIECE2))    #diag2
         return true 
    end
  end

  def game_not_over
    return @game_not_over
  end

  def play_game
    while @game_not_over
      if(is_board_full?)
        puts "\nDRAW"
        exit(true)
      end
      print_board
      coor1, coor2 = gets.split.map(&:to_i)
      if coor1 != nil && coor2 != nil
        if @turn_counter % 2 == 0
          add_piece(PIECE1, coor1, coor2)
        else
          add_piece(PIECE2, coor1, coor2)
        end
      end
      if x_is_winner?()
        puts "x wins"
        @game_not_over = false
      elsif o_is_winner?()
        puts "o wins"
        @game_not_over = false
      end
    end
  end

end

test = Tic_Tac_Toe.new()
test.play_game
#test.print_board
#test.add_piece('x', 3, 0)
#test.print_board
