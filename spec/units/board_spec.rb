require 'board'

RSpec.describe Board do
  let(:cells) { Array.new(10) { Array.new(10, false) } }

  describe '#cells' do
    it "returns an grid of false" do
      expect(subject.cells).to eq cells
    end

    it "returns a grid of false with 3 true cells horizontally" do
      subject.insert_ship(:C, 6)

      cells[6][2] = true
      cells[6][3] = true
      cells[6][4] = true

      expect(subject.cells).to eq cells
    end

    it "returns a grid with other sized ships" do
      subject.insert_ship(:E, 8, 4)

      cells[8][4] = true
      cells[8][5] = true
      cells[8][6] = true
      cells[8][7] = true

      expect(subject.cells).to eq cells
    end

    it "returns a grid with vertical ships" do
      subject.insert_ship(:H, 0, 3, :V)

      cells[0][7] = true
      cells[1][7] = true
      cells[2][7] = true

      expect(subject.cells).to eq cells
    end
  end

  describe '#insert_ship' do
    it 'should return true for a valid placement' do
      expect(subject.insert_ship(:C, 4)).to be true
    end

    it 'should allow for different sized ships' do
      expect(subject.insert_ship(:C, 0, 2)).to be true
      expect(subject.insert_ship(:C, 0, 3)).to be true
      expect(subject.insert_ship(:C, 0, 4)).to be true
      expect(subject.insert_ship(:C, 0, 5)).to be true
    end

    it 'should allow for vertical ships' do
      expect(subject.insert_ship(:C, 3, 3, :V)).to be true
    end
  end
end
