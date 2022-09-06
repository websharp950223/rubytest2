class Robot
  attr_accessor :max_x, :max_y, :pos_x, :pos_y, :direction

  def initialize(max_cord, orig_pos, move)
    @max_x, @max_y = max_cord.split
    @pos_x, @pos_y, @direction = orig_pos.split
    @pos_x = @pos_x.to_i
    @pos_y = @pos_y.to_i
    steps = move.chars

    move_robot(steps)
  end

  def move_robot(steps)
    arrows = ['N', 'E', 'S', 'W']
    steps.each do |step|
      idx = arrows.index(@direction)

      case step
      when 'L'
        if idx == 0
          @direction = arrows.last
        else
          @direction = arrows[idx - 1]
        end
      when 'R'
        if idx == arrows.length - 1
          @direction = arrows.first
        else
          @direction = arrows[idx + 1]
        end
      when 'M'
        x_step, y_step = axis_steps
        @pos_x += x_step
        @pos_y += y_step
      end
    end
    p "#{@pos_x} #{pos_y} #{@direction}"
  end

  def axis_steps
    case @direction
    when 'N'
      [0, 1]
    when 'E'
      [1, 0]
    when 'S'
      [0, -1]
    when 'W'
      [-1, 0]
    end
  end

end

robot = Robot.new("5 5", "1 2 N", "LMLMLMLMM")

robot = Robot.new("5 5", "3 3 E", "MMRMMRMRRM")
