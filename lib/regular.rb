# frozen_string_literal: true

require_relative 'item'
require_relative 'item_module'

class Regular < Item
  include ItemMethods

  def update
    @sell_in.positive? ? @quality -= 1 : @quality -= 2
    enforce_quality_boundaries
    update_sell_in
  end
end
