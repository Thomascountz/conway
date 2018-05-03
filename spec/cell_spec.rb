require 'cell'

RSpec.describe Cell do
  context 'when a new cell is initialized' do
    cell = Cell.new    
    describe '#alive?' do
      it 'returns false by default' do
        expect(cell.alive?).to eq false
      end
    end
    describe '#dead?' do
      it 'returns true by default' do
        expect(cell.dead?).to eq true
      end
    end
  end

  context 'when the cell is initialized with alive true' do
    cell = Cell.new(alive: true)
    describe '#alive?' do
      it 'returns true' do
        expect(cell.alive?).to eq true
      end
    end
    describe '#dead?' do
      it 'returns false' do
        expect(cell.dead?).to eq false
      end
    end
  end 

  describe '#birth' do
    context 'when the cell is dead' do
      cell = Cell.new(alive: false)
      it 'sets cell.alive? to true' do
        cell.birth
        expect(cell.alive?).to be true
      end
    end
  end
  
  describe '#death' do
    context 'when the cell is alive' do
      cell = Cell.new(alive: true)
      it 'sets cell.dead? to true' do
        cell.death
        expect(cell.dead?).to be true
      end
    end
  end
end
