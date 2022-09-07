require 'robot'

describe Robot do
  context "Move Robot" do
    before do
      @robot = Robot.new("5 5")
    end

    it "move robot 1" do
      expect(@robot.move("1 2 N", "LMLMLMLMM")).to eq "1 3 N"
    end

    it "move robot 2" do
      expect(@robot.move("3 3 E", "MMRMMRMRRM")).to eq "5 1 E"
    end
  end
end
