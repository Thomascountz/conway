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

  # def inoculate
  #   @cells.flatten.each do |cell|
  #     if rand(1..10) == 3 
  #       cell.set_alive
  #     end
  #   end
  # end

end
