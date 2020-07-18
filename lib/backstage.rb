# frozen_string_literal: true

require_relative 'item'
require_relative 'item_module'

class Backstage < Item
  include ItemMethods
  SELL_IN_BOUNDARY_OUTER = 10
  SELL_IN_BOUNDARY_INNER = 5

  def update
    if @sell_in > SELL_IN_BOUNDARY_OUTER
      @quality += GildedRose::QUALITY_UPDATE_VALUE
    elsif @sell_in > SELL_IN_BOUNDARY_INNER
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
