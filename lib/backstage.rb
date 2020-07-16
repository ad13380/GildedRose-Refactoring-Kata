# frozen_string_literal: true

require_relative 'item'
require_relative 'item_module'

class Backstage < Item
  include ItemMethods

  def update
    if @sell_in > 10
      @quality += 1
    elsif @sell_in > 5
      @quality += 2
    elsif @sell_in.positive?
      @quality += 3
    else
      @quality = 0
    end
    enforce_quality_boundaries
    update_sell_in
  end
end
