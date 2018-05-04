class Engine
  def initialize(colony:, renderer: ConsoleIO.new)
    @colony = colony
    @renderer = renderer
  end

  def play(num_of_generations)
    num_of_generations.times do
      renderer.render(colony)
      self.colony = colony.incubate
    end
  end

  private

  attr_accessor :colony
  attr_reader :renderer
end
