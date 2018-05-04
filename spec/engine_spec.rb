require 'engine.rb'
require 'colony'
require 'console_renderer'

RSpec.describe Engine do
  let(:colony) { instance_double(Colony) }
  let(:gen_1_colony) { instance_double(Colony) }
  let(:console_renderer) { instance_double(ConsoleRenderer) }

  subject(:engine) { described_class.new(colony: colony,
                                         renderer: console_renderer) }

  describe '#play' do
    context 'when given one generation' do
      num_of_generations = 1
      it 'renders and incubates the colony' do
        allow(colony).to receive(:incubate)

        expect(console_renderer).to receive(:render).with(colony)

        engine.play(num_of_generations)
      end
    end
    
    context 'when given two generation' do
      num_of_generations = 2
      it 'renders and incubates the colony' do
        allow(colony).to receive(:incubate).and_return(gen_1_colony)
        allow(gen_1_colony).to receive(:incubate)

        expect(console_renderer).to receive(:render).with(colony)
        expect(console_renderer).to receive(:render).with(gen_1_colony)

        engine.play(num_of_generations)
      end
    end
  end
end
