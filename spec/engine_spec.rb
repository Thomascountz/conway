require 'engine.rb'
require 'colony'
require 'console_io'

RSpec.describe Engine do
  let(:colony) { instance_double(Colony) }
  let(:consoleio) { instance_double(ConsoleIO) }

  subject(:engine) { described_class.new(colony: colony,
                                         renderer: consoleio) }

  describe '#play' do
    context 'when given one generation' do
      num_of_generations = 1
      it 'renders and incubates the colony' do
        allow(colony).to receive(:incubate)
        expect(consoleio).to receive(:render).with(colony)
        engine.play(num_of_generations)
      end
    end
  end
end
