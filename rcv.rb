# frozen_string_literal: true

class RCV
  def count(votes:, candidates:)
    if candidates.empty?
      nil
    else
      candidate_votes = count_vote(votes, candidates)
      winner(candidate_votes, candidates)
    end
  end

  private

  def count_vote(votes, candidates)
    candidate_votes = Hash.new(0)
    votes.each do |candidate, *rest|
      candidate_votes[candidate] += 1
    end
    candidate_votes
  end

  def winner(candidate_votes, candidates)
    highest_vote_count = candidate_votes.values.max
    winners = candidate_votes.select do |candidate, vote_count|
      vote_count == highest_vote_count
    end.collect(&:first)
    (candidates & winners).first
  end
end
