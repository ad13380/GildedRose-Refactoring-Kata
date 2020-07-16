# frozen_string_literal: true

require_relative 'item'
require_relative 'item_module'

class Brie < Item
  include Item_methods

  def update
    @sell_in > 0 ? @quality += 1 : @quality += 2
    enforce_quality_boundaries
    update_sell_in
  end
end