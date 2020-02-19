class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 4, 8],
        [2, 4, 6],
        [1, 4, 7],
        [0, 3, 6],
        [2, 5, 8]
    ]

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end 

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end 
    
    def input_to_index(input)
      input.to_i - 1  
    end 
    
    def move(index, token = "X")
      @board[index] = token
    end 
    
    def position_taken?(index)
      if @board[index] == " "
        false 
      else true 
      end 
    end 
    
    def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
    end 
    
    def turn_count
      turns = 0 
      @board.each do |i|
        if i == "X" || i== "O"
          turns += 1 
        end 
      end 
      turns 
    end 
    
    def current_player
      if turn_count.even?
        "X"
      else "O"
      end 
    end 
    
    def turn
      puts "Please enter 1-9:"
      input = gets.strip 
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board 
      else 
        turn 
      end 
    end 
      
      
    
    def won?
      WIN_COMBINATIONS.detect do |combination|
        if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
          then combination
        else if @board[combination [0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
          then combination
        else false 
        end 
        end 
      end 
    end 
    
    def full?
      @board.all?{|space| space != " "}
    end 
    
    def draw?
      !won? && full?
    end 
    
    def over? 
      won? || full?
    end 
    
    def winner
      if combination = won?
        then @board[combination.first]
      end 
    end 
    
    def play
     until over?
      turn
    end 
    if won?
      puts "Congrats #{winner}!"
    else draw?
      puts "draw"
    end
  end 
        
end 

