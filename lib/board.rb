class Board
  def initialize
    @cells = Array.new(10) { Array.new(10, false) }
  end

  def to_s
    string = " |A|B|C|D|E|F|G|H|I|J|\n"
    @cells.each_with_index do |row, index|
      string << "#{index}|"
      row.each { |cell| string << "#{cell ? '@' : '_'}|" }
      string << "\n"
    end
    string
  end

  def insert_ship(column, row)
    column = @@columns[column]
    for i in 0..2 do
      @cells[row][column + i] = true
    end
    true
  end
  
  @@columns = { A: 0, B: 1, C: 2, D: 3, E: 4,
                F: 5, G: 6, H: 7, I: 8, J: 9 }
end
