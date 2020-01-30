class Game
  def initialize renderer = Renderer, input = STDIN, board = Board.new
    @board = board
    @input = input
    @renderer = renderer
  end

  def run
    @renderer.draw_board @board

    @renderer.print_prompt("Please choose where to place a ship")

    ship_position = @input.gets.chomp

    ship_position = ship_position.match(/\A([A-J]), ?([0-9])\Z/)

    @renderer.print_prompt("What size of ship would you like to place")

    ship_size = @input.gets.chomp.to_i

    @board.insert_ship ship_position[1].to_sym, ship_position[2].to_i, ship_size

    @renderer.draw_board @board
  end
end
