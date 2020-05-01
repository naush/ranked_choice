# frozen_string_literal: true

module Steps
  class FilterByVoteCount
    def initialize(options)
      @filter_vote_count = options[:filter_vote_count]
    end

    def call(candidate_votes)
      candidate_votes.select do |_candidate, vote_count|
        vote_count == @filter_vote_count
      end
    end
  end
end
