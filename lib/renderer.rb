class Renderer
  def self.print_prompt prompt = ""
    return print "prompt: " if prompt.empty?
    
    print "#{prompt}: "
  end

  def self.draw_board board
    puts " |A|B|C|D|E|F|G|H|I|J|\n"

    board.cells.each_with_index do |row, index|
      puts row.reduce("#{index}|") { |string, cell| 
        string << "#{cell ? '@' : '_'}|"
      }
    end
  end
end
