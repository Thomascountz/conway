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
end
