# frozen_string_literal: true

require_relative 'item'

class Conjured < Item
  def update
    @sell_in > 0 ? @quality -= 2 : @quality -= 4
    @quality = 50 if @quality > 50
    @quality = 0 if @quality < 0
    @sell_in -= 1
  end
end