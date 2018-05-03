class Renderer

  def render(colony)
    output = ""
    colony.cells.length.times do |i|
      row = ""
      colony.cells.first.length.times do |j|
        if colony.cells[i][j].alive?
          row << "\e[32m1 \e[0m"
        else
          row << "\e[31m0 \e[0m"
        end
      end
      output << row
      output << "\n"
    end
    output
  end
  
  def test(colony)
    puts `clear`
    200.times do
      puts render(colony)
      colony = colony.incubate
      sleep(0.5)
      puts `clear`
    end
  end
      
end
