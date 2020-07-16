# frozen_string_literal: true

require 'item'
require 'gilded_rose'

describe 'Item Update' do
  before(:each) do
    @items = [
      Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
      Item.new(name="Aged Brie", sell_in=2, quality=0),
      Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
      Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
      Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
      Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
      Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
      Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
      Item.new(name="Conjured Mana Cake", sell_in=3, quality=6)
    ]
    @gilded_rose = GildedRose.new(@items)
  end

  it 'displays the name, sell_in value and quality value of each item' do
    expected_result = [
      '+5 Dexterity Vest, 10, 20',
      'Aged Brie, 2, 0',
      'Elixir of the Mongoose, 5, 7',
      'Sulfuras, Hand of Ragnaros, 0, 80',
      'Sulfuras, Hand of Ragnaros, -1, 80',
      'Backstage passes to a TAFKAL80ETC concert, 15, 20',
      'Backstage passes to a TAFKAL80ETC concert, 10, 49',
      'Backstage passes to a TAFKAL80ETC concert, 5, 49',
      'Conjured Mana Cake, 3, 6'
    ]
    @items.each_with_index do |item, index|
      expect { print item }.to output(expected_result[index]).to_stdout
    end
  end

  it 'updates an item list over 1 day' do
    expected_result = [
      '+5 Dexterity Vest, 9, 19',
      'Aged Brie, 1, 1',
      'Elixir of the Mongoose, 4, 6',
      'Sulfuras, Hand of Ragnaros, 0, 80',
      'Sulfuras, Hand of Ragnaros, -1, 80',
      'Backstage passes to a TAFKAL80ETC concert, 14, 21',
      'Backstage passes to a TAFKAL80ETC concert, 9, 50',
      'Backstage passes to a TAFKAL80ETC concert, 4, 50',
      'Conjured Mana Cake, 2, 4'
    ]
    @gilded_rose.update_quality
    @items.each_with_index do |item, index|
      expect { print item }.to output(expected_result[index]).to_stdout
    end
  end

  it 'updates an item list over several days' do
    expected_result = [
      '+5 Dexterity Vest, 7, 17',
      'Aged Brie, -1, 4',
      'Elixir of the Mongoose, 2, 4',
      'Sulfuras, Hand of Ragnaros, 0, 80',
      'Sulfuras, Hand of Ragnaros, -1, 80',
      'Backstage passes to a TAFKAL80ETC concert, 12, 23',
      'Backstage passes to a TAFKAL80ETC concert, 7, 50',
      'Backstage passes to a TAFKAL80ETC concert, 2, 50',
      'Conjured Mana Cake, 0, 0'
    ]
    3.times { @gilded_rose.update_quality }
    @items.each_with_index do |item, index|
      expect { print item }.to output(expected_result[index]).to_stdout
    end
  end
end
