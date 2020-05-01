# frozen_string_literal: true

module Steps
  class FilterByThreshold
    def initialize(options)
      @threshold = options[:threshold]
    end

    def call(candidate_votes)
      candidate_votes.select do |_candidate, vote_count|
        (vote_count.to_f / candidate_votes.values.sum) >= @threshold
      end
    end
  end
end
