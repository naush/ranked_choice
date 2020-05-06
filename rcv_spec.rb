# frozen_string_literal: true

require './rcv'

describe RCV do
  describe '#count' do
    context 'no winner' do
      subject { RCV.new.count(votes: [], candidates: []) }
      it { is_expected.to be_nil }
    end

    context 'one vote and one winner' do
      subject do
        RCV.new.count(
          votes: [
            [:liz],
          ],
          candidates: [
            :liz,
            :joe
          ]
        )
      end
      it { is_expected.to eq(:liz) }
    end

    context 'win by majority' do
      subject do
        RCV.new.count(
          votes: [
            [:liz],
            [:joe],
            [:joe]
          ],
          candidates: [
            :liz,
            :joe
          ]
        )
      end
      it { is_expected.to eq(:joe) }
    end
  end
end
