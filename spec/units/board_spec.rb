require 'board'

RSpec.describe Board do
  let(:cells) { Array.new(10) { Array.new(10, false) } }

  describe '#cells' do
    it "returns an grid of false" do
      expect(subject.cells).to eq cells
    end
  end

  describe '#insert_ship' do
    describe 'inserting a valid ship' do
      it 'inserts a horizonatal 3 ship at C3' do
        cells[3][2] = true
        cells[3][3] = true
        cells[3][4] = true

        ship = { column: :C, row: 3, size: 3, orientation: :horizontal }

        expect(subject.insert_ship ship).to eq cells
      end

      it 'inserts a horizontal 4 ship at G7' do
        cells[7][6] = true
        cells[7][7] = true
        cells[7][8] = true
        cells[7][9] = true

        ship = { column: :G, row: 7, size: 4, orientation: :horizontal }

        expect(subject.insert_ship ship).to eq cells
      end

      it 'inserts a vertical 2 ship at A4' do
        cells[4][0] = true
        cells[5][0] = true

        ship = { column: :A, row: 4, size: 2, orientation: :vertical }

        expect(subject.insert_ship ship).to eq cells
      end
    end
  end
end
