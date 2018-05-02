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
      it 'is made up of Cell objects' do
        colony = Colony.new
        expect(colony.cells.flatten).not_to be_empty
        expect(colony.cells.flatten).to all be_instance_of Cell
      end
      it 'contains a rows * columns number of Cells' do
        rows = 3
        columns = 4
        colony = Colony.new(rows: rows, columns: columns)
        expect(colony.cells.flatten.length).to be (rows * columns)
      end
    end
  end
end
