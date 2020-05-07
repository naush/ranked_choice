# frozen_string_literal: true

class RCV
  def count(votes:, candidates:)
    return nil if candidates.empty?

    candidate_votes = count_vote(votes, candidates)
    winner = winner(candidate_votes, candidates)

    if winner.nil?
      least_vote_count = candidate_votes.values.min
      losers = candidate_votes.select do |candidate, vote_count|
        vote_count == least_vote_count
      end.collect(&:first)
      loser = losers.first
      candidates.delete(loser)
      candidate_votes = count_vote(votes, candidates)
      winner = winner(candidate_votes, candidates)
    end

    winner
  end

  private

  def count_vote(votes, candidates)
    candidate_votes = Hash.new(0)
    votes.each do |vote|
      next_candidate = (vote & candidates).first
      candidate_votes[next_candidate] += 1 if next_candidate
    end
    candidate_votes
  end

  def winner(candidate_votes, candidates)
    highest_vote_count = candidate_votes.values.max
    total_vote_count = candidate_votes.values.sum
    winners = candidate_votes.select do |candidate, vote_count|
      vote_count == highest_vote_count
    end.select do |candidate, vote_count|
      vote_count.to_f / total_vote_count >= 0.5
    end.collect(&:first)
    (candidates & winners).first
  end
end
