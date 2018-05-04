class Engine

  def initialize(colony:, renderer:)
    @colony = colony
    @renderer = renderer
  end

  def play(num_of_generations)
    renderer.render(colony)
    colony.incubate
  end

  private

  attr_reader :colony, :renderer
end
