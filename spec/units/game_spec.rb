require 'game'

RSpec.describe Game do
  let(:board) { double :board, insert_ship: true }
  let(:renderer) { double :Renderer, draw_board: nil, print_prompt: nil }

  before do
    allow($stdout).to receive(:write)
  end

  describe "putting a ship at C3" do
    subject { Game.new renderer, StringIO.new("C, 3\n4\n"), board }

    describe '#run' do
      it "prints out a blank board and a board with the ship" do
        expect(renderer).to receive(:draw_board).with(board).twice
        subject.run
      end

      it "prompts a user to place a ship" do
        expected_output = "Please choose where to place a ship"
        expect(renderer).to receive(:print_prompt).with(expected_output)
        subject.run
      end

      it "prompts a user for the size of the ship" do
        expected_output = 'What size of ship would you like to place'
        expect(renderer).to receive(:print_prompt).with(expected_output)
        subject.run
      end

      it "adds a ship to the board" do
        expect(board).to receive(:insert_ship).with(:C, 3, 4)
        subject.run
      end
    end
  end
end
