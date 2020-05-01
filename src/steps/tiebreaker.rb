# frozen_string_literal: true

module Steps
  class Tiebreaker
    def initialize(options)
      @candidates = options[:candidates]
    end

    def call(finalists)
      (@candidates & finalists).first
    end
  end
end
