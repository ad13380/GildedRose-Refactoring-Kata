# frozen_string_literal: true

require_relative 'item'

class Sulfuras < Item
  def update
    @quality = 50 if @quality > 50
    @quality = 0 if @quality < 0
  end
end