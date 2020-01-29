class Game
  def initialize input = STDIN
  end

  def run
    board =  " |A|B|C|D|E|F|G|H|I|J|\n"
    board << "0|_|_|_|_|_|_|_|_|_|_|\n"
    board << "1|_|_|_|_|_|_|_|_|_|_|\n"
    board << "2|_|_|_|_|_|_|_|_|_|_|\n"
    board << "3|_|_|_|_|_|_|_|_|_|_|\n"
    board << "4|_|_|_|_|_|_|_|_|_|_|\n"
    board << "5|_|_|_|_|_|_|_|_|_|_|\n"
    board << "6|_|_|_|_|_|_|_|_|_|_|\n"
    board << "7|_|_|_|_|_|_|_|_|_|_|\n"
    board << "8|_|_|_|_|_|_|_|_|_|_|\n"
    board << "9|_|_|_|_|_|_|_|_|_|_|"

    puts board

    print "Please choose where to place a ship: "
  end
end
