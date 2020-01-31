class Game
  def initialize renderer = Renderer, input = STDIN, board = Board.new
    @board = board
    @input = input
    @renderer = renderer
  end

  def run
    render_board

    ship = prompt_ship

    @board.insert_ship(ship)

    render_board
  end

  private

  def render_board
    @renderer.draw_board @board
  end

  def prompt_ship
    ship_position = prompt_ship_position
    ship_size = prompt_ship_size
    ship_orientation = prompt_ship_orientation

    {
      column: ship_position[0],
      row: ship_position[1],
      size: ship_size,
      orientation: ship_orientation
    }
  end

  def prompt_ship_position
    @renderer.print_prompt("Please choose where to place a ship")
    user_position_input = @input.gets.chomp.match(/\A([A-J]), ?([0-9])\Z/)
    [user_position_input[1].to_sym, user_position_input[2].to_i]
  end

  def prompt_ship_size
    @renderer.print_prompt("What size of ship would you like to place")
    @input.gets.chomp.to_i
  end

  def prompt_ship_orientation
    @renderer.print_prompt('[h]orizontal or [v]ertical')
    user_orientation_input = @input.gets.chomp.to_sym
    return :horizontal if user_orientation_input == :H
    return :vertical if user_orientation_input == :V
  end
end
