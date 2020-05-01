# frozen_string_literal: true

module Pipelines
  class Winner
    def self.call(candidate_votes, candidates)
      highest_vote_count = candidate_votes.values.max

      Pipeline.new(
        [
          Steps::FilterByThreshold.new(threshold: 0.5),
          Steps::FilterByVoteCount.new(filter_vote_count: highest_vote_count),
          Steps::ExtractName.new,
          Steps::Tiebreaker.new(candidates: candidates)
        ]
      ).(candidate_votes)
    end
  end
end
