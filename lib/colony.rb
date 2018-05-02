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

  private

  def randomly_selected?
    rand(1..3) == 1
  end

end
