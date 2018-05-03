require 'colony'
require 'cell'

RSpec.describe Colony do
  describe '#cells' do
    context 'when a new Colony is initialized' do
      it 'is an Array of Arrays' do
        colony = Colony.new
        expect(colony.cells).to be_a Array
        expect(colony.cells.first).to be_a Array
      end
      it 'is made up of unique Cell objects' do
        colony = Colony.new
        expect(colony.cells.flatten).not_to be_empty
        expect(colony.cells.flatten).to all be_instance_of Cell
        expect(colony.cells.flatten.length).to eq (colony.cells.flatten.uniq.length)
      end
      it 'contains a rows * columns number of Cells' do
        rows = 3
        columns = 4
        colony = Colony.new(rows: rows, columns: columns)
        expect(colony.cells.flatten.length).to eq (rows * columns)
      end
    end
  end

  # May fail: testing random
  describe '#inoculate' do
    it 'sets about 33% of its cells to alive at random' do
      colony = Colony.new(rows: 100, columns: 100)

      colony.inoculate

      total_cell_count = colony.cells.flatten.length.to_f
      alive_cell_count = colony.cells.flatten.select(&:alive?).length.to_f
      percentage_of_alive_cells = (alive_cell_count / total_cell_count) * 100      

      expect(percentage_of_alive_cells).to be_within(2).of(33.33)
    end
  end

  describe '#incubate' do
    describe 'determining the status of each cell in the new colony' do

      context 'if a cell is dead' do
       
        context 'if exactly three of its neighbors are alive' do
          it 'sets that cell alive in the new colony' do
            colony = Colony.new(rows: 3, columns: 3)
            row = 1
            column = 1
            center_cell = colony.cells[row][column]
            center_cell.death
            colony.cells[0][0].birth
            colony.cells[0][1].birth
            colony.cells[0][2].birth
            
            new_colony = colony.incubate
            new_center_cell = new_colony.cells[row][column]

            expect(new_center_cell).to be_alive
          end
        end
  
        context 'if exactly three of its neighbors are not alive' do
          it 'remains dead in the new colony' do
            colony = Colony.new(rows: 3, columns: 3)
            row = 1
            column = 1
            center_cell = colony.cells[row][column]
            center_cell.death
            colony.cells[0][0].death
            colony.cells[0][1].death
            colony.cells[0][2].death
            
            new_colony = colony.incubate
            new_center_cell = new_colony.cells[row][column]

            expect(new_center_cell).to be_dead
          end
        end
      end

      context 'if the cell is alive' do

        context 'if less than two its neighbors are alive' do
          it 'is dead in the new colony' do
            colony = Colony.new(rows: 3, columns: 3)
            row = 1
            column = 1
            center_cell = colony.cells[row][column]
            center_cell.birth
            colony.cells[0][0].death
            colony.cells[0][1].death
            colony.cells[0][2].death
            colony.cells[1][0].death
            colony.cells[1][2].death
            colony.cells[2][0].death
            colony.cells[2][1].death

            new_colony = colony.incubate
            new_center_cell = new_colony.cells[row][column]

            expect(new_center_cell).to be_dead
          end
        end

        context 'if two neighbors are alive' do
          it 'is alive in the new colony' do
            colony = Colony.new(rows: 3, columns: 3)
            row = 1
            column = 1
            center_cell = colony.cells[row][column]
            center_cell.birth
            colony.cells[0][0].birth
            colony.cells[0][1].birth
            
            new_colony = colony.incubate
            new_center_cell = new_colony.cells[row][column]

            expect(new_center_cell).to be_alive
          end
        end

        context 'if three its neighbors are alive' do
          it 'is alive in the new colony' do
            colony = Colony.new(rows: 3, columns: 3)
            row = 1
            column = 1
            center_cell = colony.cells[row][column]
            center_cell.birth
            colony.cells[0][0].birth
            colony.cells[0][1].birth
            colony.cells[0][2].birth
            
            new_colony = colony.incubate
            new_center_cell = new_colony.cells[row][column]

            expect(new_center_cell).to be_alive
          end
        end

        context 'if greater than three of its neighbors are alive' do
          it 'is dead in the new colony' do
            colony = Colony.new(rows: 3, columns: 3)
            row = 1
            column = 1
            center_cell = colony.cells[row][column]
            center_cell.birth
            colony.cells[0][0].birth
            colony.cells[0][1].birth
            colony.cells[0][2].birth
            colony.cells[1][0].birth
            
            new_colony = colony.incubate
            new_center_cell = new_colony.cells[row][column]

            expect(new_center_cell).to be_dead
          end
        end
      end
    end

    context 'when a dead cell has three alive neighbors beyond the borders of the colony' do
      it 'considers those neighbors dead' do
        colony = Colony.new(rows: 3, columns: 3)
        row = 0
        column = 0
        corner_cell = colony.cells[row][column]
        corner_cell.death

        colony.cells[2][1].birth
        colony.cells[2][0].birth
        colony.cells[2][2].birth

        colony.cells[0][2].death
        colony.cells[1][2].death
        colony.cells[0][1].death
        colony.cells[1][1].death
        colony.cells[1][0].death

        new_colony = colony.incubate
        new_center_cell = new_colony.cells[row][column]

        expect(new_center_cell).to be_dead
      end
    end
  end
end
