require 'spec_helper'

require 'gilded_rose'

describe GildedRose do
  subject(:glided_rose) { described_class.new([item]) }

  let(:quality) { 20 }
  let(:sell_in) { 10 }
  let(:name) { 'foo' }
  let(:item) { Item.new(name, sell_in, quality) }

  describe '#update_quality' do
    before do
      glided_rose.update_quality
    end

    shared_examples 'item.name' do
      it 'does not change the name' do
        expect(item.name).to eq name
      end
    end

    shared_examples 'item' do
      it_behaves_like 'item.name'

      it 'reduces sell_in by one' do
        expect(item.sell_in).to eq sell_in - 1
      end
    end

    context 'with normal item' do
      it_behaves_like 'item'

      it 'reduces quality by one' do
        expect(item.quality).to eq quality - 1
      end

      context 'when quality is zero' do
        let(:quality) { 0 }

        it 'does not change quality to negative' do
          expect(item.quality).to eq 0
        end
      end

      context 'when sell_in is negative' do
        let(:sell_in) { -1 }

        it 'reduces quality by two (twice as fast)' do
          expect(item.quality).to eq quality - 2
        end
      end
    end

    context 'with "Aged Brie" item' do
      let(:name) { 'Aged Brie' }

      it_behaves_like 'item'

      it 'increments quality by one' do
        expect(item.quality).to eq quality + 1
      end

      context 'when quality is fifty' do
        let(:quality) { 50 }

        it 'does not increment quality more than 50' do
          expect(item.quality).to eq 50
        end
      end
    end

    context 'with "Sulfuras" item' do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }
      let(:quality) { 80 }

      it_behaves_like 'item.name'

      it 'does not change sell_in' do
        expect(item.sell_in).to eq sell_in
      end

      it 'has constant quality' do
        expect(item.quality).to eq 80
      end
    end

    context 'with "Backstage passes" item' do
      let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

      it_behaves_like 'item'

      context 'when sell_in is more than 10 days' do
        let(:sell_in) { 11 }

        it 'increases quality by one' do
          expect(item.quality).to eq quality + 1
        end
      end

      context 'when sell_in is between 6 and 10 days' do
        let(:sell_in) { 10 }

        it 'increases quality by two' do
          expect(item.quality).to eq quality + 2
        end
      end

      context 'when sell_in is between 0 and 5 days' do
        let(:sell_in) { 5 }

        it 'increases quality by three' do
          expect(item.quality).to eq quality + 3
        end
      end

      context 'when sell_in is less than 0 days' do
        let(:sell_in) { -1 }

        it 'set quality to zero' do
          expect(item.quality).to eq 0
        end
      end
    end

    context 'with "Conjured" item' do
      let(:name) { 'Conjured Mana Cake' }

      it_behaves_like 'item'

      it 'reduces quality by two (twice as fast as normal items)' do
        expect(item.quality).to eq quality - 2
      end

      context 'when sell_in is negative' do
        let(:sell_in) { -1 }

        it 'reduces quality by four (twice as fast and twice as fast as normal items)' do
          expect(item.quality).to eq quality - 4
        end
      end
    end
  end
end
