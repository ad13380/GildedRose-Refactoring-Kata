# frozen_string_literal: true

require 'gilded_rose'
require 'item'

describe GildedRose do
  describe '#update_quality' do
    before(:each) do
      @items = [Item.new('foo', 10, 0)]
      GildedRose.new(@items).update_quality
    end

    it 'does not change the name' do
      expect(@items[0].name).to eq 'foo'
    end

    it 'decreases sell_in value by 1' do
      expect(@items[0].sell_in).to eq 9
    end
  end

  describe '#Regular Item' do
    describe 'quality' do
      it 'decreases by 1 each day when sell_in value is greater than 0' do
        items = [Item.new('A regular Item', 2, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 9
      end

      it 'decreases by 2 each day when sell_in value is 0 or less' do
        items = [Item.new('A regular Item', 0, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 8
      end

      it 'has a minimum value of 0' do
        items = [Item.new('A regular Item', 0, 10)]
        6.times { GildedRose.new(items).update_quality }
        expect(items[0].quality).to eq 0
      end
    end
  end

  describe '#Sulfuras' do
    before(:each) do
      @items = [Item.new('Sulfuras, Hand of Ragnaros', 2, 10)]
      GildedRose.new(@items).update_quality
    end

    describe 'quality' do
      it 'does not decrease' do
        2.times { GildedRose.new(@items).update_quality }
        expect(@items[0].quality).to eq 10
      end
    end

    describe 'sell in' do
      it 'does not decrease' do
        expect(@items[0].sell_in).to eq 2
      end
    end
  end

  describe '#Aged Brie' do
    describe 'quality' do
      it 'increases by 1 each day when sell_in value is greater than 0' do
        items = [Item.new('Aged Brie', 2, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 1
      end

      it 'increases by 2 each day when sell_in value is 0 or less' do
        items = [Item.new('Aged Brie', 0, 0)]
        4.times { GildedRose.new(items).update_quality }
        expect(items[0].quality).to eq 8
      end

      it 'has a maximum value of 50' do
        items = [Item.new('Aged Brie', 0, 0)]
        26.times { GildedRose.new(items).update_quality }
        expect(items[0].quality).to eq 50
      end
    end
  end

  describe '#Backstage passes to a TAFKAL80ETC concert' do
    describe 'quality' do
      it 'increases by 1 each day when sell_in value is greater than 10' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 1
      end

      it 'increases by 2 each day when sell_in value is 10 or less and greater than 5' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 7, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 2
      end

      it 'increases by 3 each day when sell_in value is 5 or less and greater than 0' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 3
      end

      it 'has a maximum value of 50' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 50)]
        GildedRose.new(items).update_quality 
        expect(items[0].quality).to eq 50
      end

      it 'is set to 0 when sell_in value is 0 or less' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 2, 10)]
        3.times { GildedRose.new(items).update_quality }
        expect(items[0].quality).to eq 0
      end
    end
  end

  describe '#Conjured' do
    describe 'quality' do
      it 'decreases by 1 each day when sell_in value is greater than 0' do
        items = [Item.new('Conjured', 2, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 8
      end

      it 'increases by 4 each day when sell_in value is 0 or less' do
        items = [Item.new('Conjured', 0, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 6
      end

      it 'has a minimum value of 0' do
        items = [Item.new('Conjured', 0, 10)]
        6.times { GildedRose.new(items).update_quality }
        expect(items[0].quality).to eq 0
      end
    end
  end
end
