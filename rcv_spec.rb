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
            [:liz]
          ],
          candidates: %i[
            liz
            joe
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
          candidates: %i[
            liz
            joe
          ]
        )
      end
      it { is_expected.to eq(:joe) }
    end

    context 'winners tie' do
      subject do
        RCV.new.count(
          votes: [
            [:liz],
            [:liz],
            [:joe],
            [:joe]
          ],
          candidates: %i[
            joe
            liz
          ]
        )
      end
      it { is_expected.to eq(:joe) }
    end

    context 'one round of instant runoff' do
      subject do
        RCV.new.count(
          votes: [
            %i[liz joe don],
            %i[liz joe don],
            %i[joe liz don],
            %i[joe liz don],
            %i[don joe liz]
          ],
          candidates: %i[
            liz
            don
            joe
          ]
        )
      end
      it { is_expected.to eq(:joe) }
    end

    context 'losers tie' do
      subject do
        RCV.new.count(
          votes: [
            %i[liz joe don],
            %i[liz joe don],
            %i[liz joe don],
            %i[joe liz don],
            %i[joe liz don],
            %i[don joe liz],
            %i[don joe liz]
          ],
          candidates: %i[
            liz
            don
            joe
          ]
        )
      end
      it { is_expected.to eq(:joe) }
    end

    context 'multiple rounds of instant runoff' do
      subject do
        RCV.new.count(
          votes: [
            %i[don liz joe andy],
            %i[don liz joe andy],
            %i[don liz joe andy],
            %i[don liz joe andy],
            %i[joe liz andy don],
            %i[joe liz andy don],
            %i[joe liz andy don],
            %i[liz joe andy don],
            %i[liz joe andy don],
            %i[andy liz joe don]
          ],
          candidates: %i[
            don
            joe
            liz
            andy
          ]
        )
      end
      it { is_expected.to eq(:liz) }
    end
  end
end
