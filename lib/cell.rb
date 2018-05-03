class Cell
  
  attr_reader :x, :y

  def initialize(x: nil, y: nil, alive: false)
    @x = x
    @y = y
    @alive = alive
  end

  def alive?
    @alive
  end

  def dead?
    !@alive
  end

  def set_alive
    @alive = true
  end

  def set_dead
    @alive = false
  end
end
