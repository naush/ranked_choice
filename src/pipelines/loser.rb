# frozen_string_literal: true

module Pipelines
  class Loser
    def self.call(candidate_votes, candidates)
      lowest_vote_count = candidate_votes.values.min

      Pipeline.new(
        [
          Steps::FilterByVoteCount.new(filter_vote_count: lowest_vote_count),
          Steps::ExtractName.new,
          Steps::Tiebreaker.new(candidates: candidates)
        ]
      ).(candidate_votes)
    end
  end
end
