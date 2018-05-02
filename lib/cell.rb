class Cell
  def initialize(alive: false)
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
end
