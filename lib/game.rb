class Game
  def initialize input = STDIN, board = Board.new
    @board = board
    @input = input
  end

  def run
    puts @board.to_s

    print "Please choose where to place a ship: "

    ship_position = @input.gets.chomp

    ship_position = ship_position.match(/\A([A-J]), ?([0-9])\Z/)

    @board.insert_ship ship_position[1].to_sym, ship_position[2].to_i

    puts @board.to_s
  end
end
