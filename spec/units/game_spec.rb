require 'game'

shared_examples 'placing a ship' do |input, ship|
  describe "placing a ship with #{input.inspect}" do
    subject { Game.new renderer, StringIO.new(input), board }

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

    it "prompts a user for the orientation of the ship" do
      expected_output = '[h]orizontal or [v]ertical'
      expect(renderer).to receive(:print_prompt).with(expected_output)
      subject.run
    end

    it "adds a ship to the board" do
      expect(board).to receive(:insert_ship).with ship
      subject.run
    end
  end
end

RSpec.describe Game do
  let(:board) { double :board, insert_ship: true }
  let(:renderer) { double :Renderer, draw_board: nil, print_prompt: nil }

  before do
    allow($stdout).to receive(:write)
  end

  describe "putting a ship at C3" do
    include_examples 'placing a ship', "C, 3\n3\nH\n",
      { column: :C, row: 3, size: 3, orientation: :horizontal }

    include_examples 'placing a ship', "G, 5\n2\nV\n",
      { column: :G, row: 5, size: 2, orientation: :vertical }

    include_examples 'placing a ship', "A, 9\n5\nH\n",
      { column: :A, row: 9, size: 5, orientation: :horizontal }
  end
end
