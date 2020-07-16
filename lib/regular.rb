# frozen_string_literal: true

require_relative 'item'

class Regular < Item
  def update
    @sell_in > 0 ? @quality -= 1 : @quality -= 2
    @quality = 50 if @quality > 50
    @quality = 0 if @quality < 0
    @sell_in -= 1
  end
end