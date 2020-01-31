RSpec.describe "Placing a vertical ship" do
  let(:game) { Game.new Renderer, StringIO.new("D, 5\n3\nV\n") }

  it "should ask for the orientation of the ship" do
    expected_output = /\[h\]orizontal or \[v\]ertical: (?!\n)/

    expect { game.run }.to output(expected_output).to_stdout
  end
  
  it "prints a users ship vertically" do
    expected_output =  ' \|A\|B\|C\|D\|E\|F\|G\|H\|I\|J\|\n'
    expected_output << '0\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
    expected_output << '1\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
    expected_output << '2\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
    expected_output << '3\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
    expected_output << '4\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
    expected_output << '5\|_\|_\|_\|@\|_\|_\|_\|_\|_\|_\|\n'
    expected_output << '6\|_\|_\|_\|@\|_\|_\|_\|_\|_\|_\|\n'
    expected_output << '7\|_\|_\|_\|@\|_\|_\|_\|_\|_\|_\|\n'
    expected_output << '8\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'
    expected_output << '9\|_\|_\|_\|_\|_\|_\|_\|_\|_\|_\|\n'

    expected_output = Regexp.new expected_output

    expect { game.run }.to output(expected_output).to_stdout
  end
end
