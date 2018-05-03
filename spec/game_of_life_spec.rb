require_relative '../game_of_life'

RSpec.describe GameOfLife do
  describe '#play' do
    context 'when given one generation' do
      it 'displays the inoculated colony' do
        # colony recieves inoculate
        # renderer recieves render with colony
      end
    end
    context 'when given two generations' do
      it 'displays plays the game for two generations' do
        # colony recieves inoculate
        # renderer recieves render with colony
        # colony receives incubate and returns gen_1 colony
        # renderer recieves render with gen_1 colony
      end
    end
  end
end
