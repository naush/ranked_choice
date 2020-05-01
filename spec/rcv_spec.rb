# frozen_string_literal: true

require 'spec_helper'

describe RCV do
  describe '.count' do
    context 'when no winners' do
      subject { RCV.count(votes: [], candidates: []) }
      it { is_expected.to be_nil }
    end

    context 'when one vote' do
      subject do
        RCV.count(
          votes: [[:liz]],
          candidates: %i[liz joe]
        )
      end

      it { is_expected.to eq(:liz) }
    end

    context 'when majority wins' do
      subject do
        RCV.count(
          votes: [
            [:joe],
            [:liz],
            [:liz]
          ],
          candidates: %i[liz joe]
        )
      end

      it { is_expected.to eq(:liz) }
    end

    context 'when winners tie' do
      subject do
        RCV.count(
          votes: [
            [:joe],
            [:joe],
            [:liz],
            [:liz]
          ],
          candidates: %i[liz joe]
        )
      end

      it { is_expected.to eq(:liz) }
    end

    context 'when having one round of instant runoff' do
      subject do
        RCV.count(
          votes: [
            %i[joe liz don],
            %i[joe liz don],
            %i[liz joe don],
            %i[liz joe don],
            %i[don joe liz]
          ],
          candidates: %i[liz joe don]
        )
      end

      it { is_expected.to eq(:joe) }
    end

    context 'when losers tie' do
      subject do
        RCV.count(
          votes: [
            %i[liz joe don],
            %i[liz joe don],
            %i[liz joe don],
            %i[don joe liz],
            %i[don joe liz],
            %i[joe don liz],
            %i[joe don liz]
          ],
          candidates: %i[joe don liz]
        )
      end

      it { is_expected.to eq(:don) }
    end

    context 'when having multiple rounds of instant runoff' do
      subject do
        RCV.count(
          votes: [
            %i[don joe andy liz],
            %i[don joe andy liz],
            %i[don joe andy liz],
            %i[don joe andy liz],
            %i[liz joe andy don],
            %i[liz joe andy don],
            %i[joe liz andy don],
            %i[joe liz andy don],
            %i[andy liz joe don]
          ],
          candidates: %i[joe don liz andy]
        )
      end

      it { is_expected.to eq(:liz) }
    end
  end
end
