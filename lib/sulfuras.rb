# frozen_string_literal: true

require_relative 'item'
require_relative 'item_module'

class Sulfuras < Item
  include Item_methods

  def update
    enforce_quality_boundaries
  end
end