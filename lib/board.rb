class Board
  attr_reader :cells

  def initialize
    @cells = Array.new(10) { Array.new(10, false) }
  end

  def insert_ship(column, row, size = 3, orientation = :H)
    column = @@columns[column]
    for i in 0...size do
      set_cell_to_ship(row, column, i, orientation)
    end
    true
  end
  
  @@columns = { A: 0, B: 1, C: 2, D: 3, E: 4,
                F: 5, G: 6, H: 7, I: 8, J: 9 }

  private

  def set_cell_to_ship(row, column, offset, orientation)
    if orientation == :H
      @cells[row][column + offset] = true
    else
      @cells[row + offset][column] = true
    end
  end
end
