# frozen_string_literal: true

require_relative 'item'
require_relative 'item_module'

class Sulfuras < Item
  include ItemMethods

  def update
    enforce_quality_boundaries
  end
end
