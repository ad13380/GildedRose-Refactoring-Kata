# frozen_string_literal: true

require_relative 'item'
require_relative 'item_module'

class Conjured < Item
  include ItemMethods

  def update
    @sell_in.positive? ? @quality -= 2 : @quality -= 4
    enforce_quality_boundaries
    update_sell_in
  end
end
