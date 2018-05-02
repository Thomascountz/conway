require 'cell' 

class Colony

  attr_reader :cells

  def initialize(rows: 10, columns: 10)
    @cells = []
    row = []
    columns.times do 
      row << Cell.new
    end
    rows.times do
      @cells << row
    end
  end

end
