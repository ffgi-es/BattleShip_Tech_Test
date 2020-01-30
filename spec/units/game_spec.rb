require 'game'

RSpec.describe Game do
  let(:board_string) { "Board as a string" }
  let(:board) { double :board, to_s: board_string, insert_ship: true }

  before do
    allow($stdout).to receive(:write)
  end

  describe "putting a ship at C3" do
    subject { Game.new StringIO.new("C, 3\n"), board }

    describe '#run' do
      it "prints out a blank board" do
        expected_output = Regexp.new(board_string)
        expect { subject.run }.to output(expected_output).to_stdout
      end

      it "prompts a user to place a ship" do
        expected_output = /Please choose where to place a ship: (?!\n)/

        expect { subject.run }.to output(expected_output).to_stdout
      end

      it "adds a ship to the board" do
        expect(board).to receive(:insert_ship).with(:C, 3)
        subject.run
      end

      it "prints the board once the ship has been placed" do
        allow(board).to receive(:to_s).and_return("Blank board", "Filled Board")
        expected_output = "Blank board\nPlease choose where to place a ship: Filled Board\n"

        expect { subject.run }.to output(expected_output).to_stdout
      end
    end
  end
end
