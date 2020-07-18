# frozen_string_literal: true

require_relative 'item'
require_relative 'item_module'

class Backstage < Item
  include ItemMethods

  def update
    if @sell_in > 10
      @quality += GildedRose::QUALITY_UPDATE_VALUE
    elsif @sell_in > 5
      @quality += 2 * GildedRose::QUALITY_UPDATE_VALUE
    elsif @sell_in.positive?
      @quality += 3 * GildedRose::QUALITY_UPDATE_VALUE
    else
      @quality = 0
    end
    enforce_quality_boundaries
    update_sell_in
  end
end
