require 'game'

RSpec.describe Game do
  subject { Game.new StringIO.new("C, 3\n") }

  describe '#run' do
    it "prints out a blank board" do
      expected_output =  ' \|A\|B\|C\|D\|E\|F\|G\|H\|I\|J\|\n'
      expected_output << '0\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
      expected_output << '1\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
      expected_output << '2\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
      expected_output << '3\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
      expected_output << '4\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
      expected_output << '5\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
      expected_output << '6\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
      expected_output << '7\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
      expected_output << '8\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
      expected_output << '9\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'

      expected_output = Regexp.new expected_output

      expect { subject.run }.to output(expected_output).to_stdout
    end

    it "prompts a user to place a ship" do
      expected_output = /Please choose where to place a ship: (?!\n)/

      expect { subject.run }.to output(expected_output).to_stdout
    end
  end
end
