# frozen_string_literal: true

class Tally
  def self.call(votes, candidates)
    votes.each_with_object(Hash.new(0)) do |vote, candidate_votes|
      next_candidate = (vote & candidates).first
      candidate_votes[next_candidate] += 1 if next_candidate
    end
  end
end
