require 'cell'

class Colony

  attr_reader :cells

  def initialize(rows: 10, columns: 10)
    @rows = rows
    @columns = columns
    @cells = []
    @rows.times do |x|
      row = []
      @columns.times do |y|
        row << Cell.new(x: x, y: y, alive: false)
      end
      @cells << row
    end
  end

  def inoculate
    cells.flatten.each do |cell|
      if randomly_selected?
        cell.set_alive
      end
    end
  end

  def incubate
    new_colony = copy_colony
    cells.flatten.each do |cell|
      if cell.dead? && number_of_alive_neighbors(cell) == 3
        new_colony.cell_at(cell.x, cell.y).set_alive
      elsif cell.alive? && (number_of_alive_neighbors(cell) > 1 && number_of_alive_neighbors(cell) < 4)
        new_colony.cell_at(cell.x, cell.y).set_alive
      end
    end
    new_colony
  end

  def cell_at(x, y)
    if cells[x]
      cells[x][y]
    else
      nil
    end
  end

  private 

  def randomly_selected?
    rand(1..3) == 1
  end

  def number_of_alive_neighbors(cell)
    neighbors = get_neighbors(cell)
    neighbors.select(&:alive?).count
  end

  def get_neighbors(cell)
    x = cell.x
    y = cell.y
    neighbors = []
    neighbors << cell_at(x - 1, y - 1)
    neighbors << cell_at(x - 1, y)
    neighbors << cell_at(x - 1, y + 1)
    neighbors << cell_at(x, y - 1)
    neighbors << cell_at(x, y + 1)
    neighbors << cell_at(x + 1, y - 1)
    neighbors << cell_at(x + 1, y)
    neighbors << cell_at(x + 1, y + 1)
    neighbors.compact
  end

  def copy_colony
    self.class.new(rows: @rows, columns: @columns)
  end

end
