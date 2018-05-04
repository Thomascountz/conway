class Engine
  def initialize(colony:, renderer: ConsoleIO.new)
    @colony = colony
    @renderer = renderer
  end

  def play(num_of_generations)
    num_of_generations.times do
      @renderer.render(@colony)
      @colony = @colony.incubate
    end
  end
end
