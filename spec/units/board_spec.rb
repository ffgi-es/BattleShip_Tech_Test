require 'board'

RSpec.describe Board do
  describe '#to_s' do
    it "prints out a blank board" do
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

      expect(subject.to_s).to eq expected_output
    end

    it "prints out a board with a ship in it" do
      subject.insert_ship(:C, 6)

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

      expect(subject.to_s).to eq expected_output
    end
  end

  describe '#insert_ship' do
    it 'should return true for a valid placement' do
      expect(subject.insert_ship(:C, 4)).to be true
    end
  end
end
