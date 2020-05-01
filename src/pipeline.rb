# frozen_string_literal: true

class Pipeline
  def initialize(steps)
    @steps = steps
  end

  def call(data)
    @steps.reduce(data) do |sum, step|
      step.(sum)
    end
  end
end
