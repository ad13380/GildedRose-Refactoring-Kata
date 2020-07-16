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
end
