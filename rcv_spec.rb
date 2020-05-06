# frozen_string_literal: true

require './rcv'

describe RCV do
  describe '#count' do
    context 'no winner' do
      subject { RCV.new.count(votes: [], candidates: []) }
      it { is_expected.to be_nil }
    end
  end
end
