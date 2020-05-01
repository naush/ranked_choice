# frozen_string_literal: true

module Steps
  class ExtractName
    def call(candidate_votes)
      candidate_votes.collect(&:first)
    end
  end
end
