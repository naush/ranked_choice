# frozen_string_literal: true

module RCV
  def self.count(votes:, candidates:)
    winner = nil

    while winner.nil? && candidates.any?
      candidate_votes = Tally.(votes, candidates)
      winner = Pipelines::Winner.(candidate_votes, candidates)
      loser = Pipelines::Loser.(candidate_votes, candidates)
      candidates.delete(loser)
    end

    winner
  end
end
