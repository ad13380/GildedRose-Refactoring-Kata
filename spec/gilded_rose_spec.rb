# frozen_string_literal: true

require 'gilded_rose'
require 'item'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end

  describe '#Sulfuras' do
    describe 'quality' do
      it 'does not decrease before sell by date' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 10
      end

      it 'does not decrease after sell by date' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 10)]
        11.times { GildedRose.new(items).update_quality }
        expect(items[0].quality).to eq 10
      end
    end
  end
end
