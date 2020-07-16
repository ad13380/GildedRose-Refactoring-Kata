module Item_methods
  def update_sell_in()
    @sell_in -= 1
  end

  def enforce_quality_boundaries()
    @quality = 50 if @quality > 50
    @quality = 0 if @quality < 0
  end
end