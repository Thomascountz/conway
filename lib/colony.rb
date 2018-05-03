require 'cell'

class Colony

  attr_reader :cells

  def initialize(rows: 10, columns: 10)
    @rows = rows
    @columns = columns
    @cells = []
    @rows.times do |row_number|
      row = []
      @columns.times do |column_number|
        row << Cell.new(row: row_number, column: column_number, alive: false)
      end
      @cells << row
    end
  end

  def inoculate
    cells.flatten.each do |cell|
      if randomly_selected?
        cell.birth
      end
    end
  end

  def incubate
    new_colony = copy_colony
    cells.flatten.each do |cell|
      new_cell = new_colony.cell_at(cell.row, cell.column)
      alive_neighbor_count = number_of_alive_neighbors(cell) 
      if alive_neighbor_count == 3 || (cell.alive? && alive_neighbor_count == 2)
        new_cell.birth
      else
        new_cell.death
      end
    end
    new_colony
  end

  def cell_at(row, column)
    if cells[row]
      cells[row][column]
    else
      nil
    end
  end

  private 

  def randomly_selected?
    rand(1..3) == 1
  end

  def number_of_alive_neighbors(cell)
    neighbors = get_immediate_neighbors(cell)
    neighbors.select(&:alive?).count
  end

  def get_immediate_neighbors(cell)
    row = cell.row
    column = cell.column
    neighbors = []
    neighbors << cell_at(row - 1, column - 1)
    neighbors << cell_at(row - 1, column)
    neighbors << cell_at(row - 1, column + 1)
    neighbors << cell_at(row, column - 1)
    neighbors << cell_at(row, column + 1)
    neighbors << cell_at(row + 1, column - 1)
    neighbors << cell_at(row + 1, column)
    neighbors << cell_at(row + 1, column + 1)
    neighbors.compact
  end

  def copy_colony
    self.class.new(rows: @rows, columns: @columns)
  end

end
