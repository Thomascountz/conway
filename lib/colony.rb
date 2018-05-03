require 'cell'

class Colony

  attr_reader :cells

  def initialize(rows: 10, columns: 10)
    @cells = []
    rows.times do
      row = []
      columns.times do 
        row << Cell.new
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
    cells.each_with_index do |row_of_cells, row_number|
      row_of_cells.each_with_index do |cell, column_number|
        neighbors = get_neighbors(row_number, column_number)
        puts neighbors.select(&:alive?).count
        puts cell.alive?
        if cell.dead? && neighbors.select(&:alive?).count == 3
        cell.set_alive
        end
      end
    end
  end

  private

  def randomly_selected?
    rand(1..3) == 1
  end

  def get_neighbors(row_number, column_number)
    neighbors = []
    neighbors << cell_at(row_number - 1, column_number - 1)
    neighbors << cell_at(row_number - 1, column_number)
    neighbors << cell_at(row_number - 1, column_number + 1)
    neighbors << cell_at(row_number, column_number - 1)
    neighbors << cell_at(row_number, column_number + 1)
    neighbors << cell_at(row_number + 1, column_number - 1)
    neighbors << cell_at(row_number + 1, column_number)
    neighbors << cell_at(row_number + 1, column_number + 1)
    neighbors.compact
  end

  def cell_at(row_number, column_number)
    if cells[row_number]
      cells[row_number][column_number]
    else
      nil
    end
  end


end
