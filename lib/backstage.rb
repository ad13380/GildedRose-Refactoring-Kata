# frozen_string_literal: true

require_relative 'item'

class Backstage < Item
  def update
    if @sell_in > 10
      @quality += 1
    elsif @sell_in > 5
      @quality += 2
    elsif @sell_in > 0 
      @quality += 3
    else
      @quality = 0
    end
    @quality = 50 if @quality > 50
    @quality = 0 if @quality < 0
    @sell_in -= 1
  end
end