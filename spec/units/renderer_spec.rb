require 'renderer'

RSpec.describe Renderer do
  describe '.print_prompt' do
    it 'should output "prompt: " for an empty string without a new line' do
      expect { Renderer.print_prompt "" }.to output("prompt: ").to_stdout
    end

    it 'should default to "prompt: "' do
      expect { Renderer.print_prompt }.to output("prompt: ").to_stdout
    end

    it 'should print the input string without a new line' do
      expect { Renderer.print_prompt "Hello" }.to output("Hello: ").to_stdout
    end
  end

  describe '.draw_board' do
    it 'prints out an empty board' do
      board = double(:board,
                     cells: Array.new(10) { Array.new(10, false) })

      expected_output =  " |A|B|C|D|E|F|G|H|I|J|\n"
      expected_output << "0|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "1|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "2|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "3|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "4|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "5|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "6|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "7|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "8|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "9|_|_|_|_|_|_|_|_|_|_|\n"

      expect { Renderer.draw_board board }.to output(expected_output).to_stdout
    end

    it "prints out a board with a ship in it" do
      cells = Array.new(10) { Array.new(10, false) }
      cells[6][2] = true
      cells[6][3] = true
      cells[6][4] = true
      board = double :board, cells: cells

      expected_output =  " |A|B|C|D|E|F|G|H|I|J|\n"
      expected_output << "0|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "1|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "2|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "3|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "4|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "5|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "6|_|_|@|@|@|_|_|_|_|_|\n"
      expected_output << "7|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "8|_|_|_|_|_|_|_|_|_|_|\n"
      expected_output << "9|_|_|_|_|_|_|_|_|_|_|\n"

      expect { Renderer.draw_board board }.to output(expected_output).to_stdout
    end
  end
end
