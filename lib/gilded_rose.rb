# frozen_string_literal: true

require_relative 'brie'
require_relative 'backstage'
require_relative 'conjured'
require_relative 'regular'
require_relative 'sulfuras'

class GildedRose
  SELL_IN_DECREMENT = 1
  QUALITY_UPDATE_VALUE = 1
  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50

  def initialize(items)
    @items = items.map! do |item|
      item_model(item).new(item.name, item.sell_in, item.quality)
    end
  end

  def update_quality
    @items.each(&:update)
  end

  private

  def item_model(item)
    if item.name.include?('Sulfuras')
      Sulfuras
    elsif item.name.include?('Aged Brie')
      Brie
    elsif item.name.include?('Backstage')
      Backstage
    elsif item.name.include?('Conjured')
      Conjured
    else
      Regular
    end
  end
end
