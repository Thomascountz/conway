class Cell
  attr_reader :row, :column

  def initialize(row: nil, column: nil, alive: false)
    @row = row
    @column = column
    @alive = alive
  end

  def alive?
    @alive
  end

  def dead?
    !@alive
  end

  def birth
    @alive = true
  end

  def death
    @alive = false
  end
end
