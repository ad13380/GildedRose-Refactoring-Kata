# frozen_string_literal: true

module ItemMethods
  def update_sell_in
    @sell_in -= GildedRose::SELL_IN_DECREMENT
  end

  def enforce_quality_boundaries
    @quality = GildedRose::MAXIMUM_QUALITY if @quality > GildedRose::MAXIMUM_QUALITY
    @quality = GildedRose::MINIMUM_QUALITY if @quality < GildedRose::MINIMUM_QUALITY
  end
end
