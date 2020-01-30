require 'board'

RSpec.describe Board do
  let(:cells) { Array.new(10) { Array.new(10, false) } }

  describe '#cells' do
    it "prints out a blank board" do
      expect(subject.cells).to eq cells
    end

    it "prints out a board with a ship in it" do
      subject.insert_ship(:C, 6)

      cells[6][2] = true
      cells[6][3] = true
      cells[6][4] = true

      expect(subject.cells).to eq cells
    end
  end

  describe '#insert_ship' do
    it 'should return true for a valid placement' do
      expect(subject.insert_ship(:C, 4)).to be true
    end
  end
end
