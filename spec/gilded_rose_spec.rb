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

    it 'decreases sell_in value by 1' do
      items = [Item.new('foo', 10, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end
  end

  describe '#Regular Item' do
    before(:each) do
      @items = [Item.new('A regular Item', 2, 10)]
      GildedRose.new(@items).update_quality
    end

    describe 'quality' do
      it 'decreases by 1 each day before sell_in value' do
        GildedRose.new(@items).update_quality
        expect(@items[0].quality).to eq 8
      end

      it 'decreases by 2 each day after sell_in value' do
        3.times { GildedRose.new(@items).update_quality }
        expect(@items[0].quality).to eq 4
      end

      it 'has a minimum value of 0' do
        11.times { GildedRose.new(@items).update_quality }
        expect(@items[0].quality).to eq 0
      end
    end
  end

  describe '#Sulfuras' do
    before(:each) do
      @items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 10)]
      GildedRose.new(@items).update_quality
    end

    describe 'quality' do
      it 'does not decrease before sell_in value' do
        expect(@items[0].quality).to eq 10
      end

      it 'does not decrease after sell_in value' do
        3.times { GildedRose.new(@items).update_quality }
        expect(@items[0].quality).to eq 10
      end
    end
  end

  describe '#Aged Brie' do
    before(:each) do
      @items = [Item.new('Aged Brie', 2, 10)]
      GildedRose.new(@items).update_quality
    end

    describe 'quality' do
      it 'increases by 1 each day before sell_in value' do
        GildedRose.new(@items).update_quality
        expect(@items[0].quality).to eq 12
      end

      it 'increases by 2 each day after sell_in value' do
        3.times { GildedRose.new(@items).update_quality }
        expect(@items[0].quality).to eq 16
      end

      it 'has a maximum value of 50' do
        51.times { GildedRose.new(@items).update_quality }
        expect(@items[0].quality).to eq 50
      end
    end
  end
end
