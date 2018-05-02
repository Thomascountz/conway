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
end
