require_relative 'brie'
require_relative 'backstage'
require_relative 'conjured'
require_relative 'regular'
require_relative 'sulfuras'

class GildedRose
  def initialize(items)
    #@items = items
    @items = items.map! { |item| item_model(item).new(item.name, item.sell_in, item.quality) }
  end

  # def update_sulfuras(item)
  #   item.quality = 50 if item.quality > 50
  #   item.quality = 0 if item.quality < 0
  # end

  # def update_regular(item)
  #   item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
  #   item.quality = 50 if item.quality > 50
  #   item.quality = 0 if item.quality < 0
  #   item.sell_in -= 1
  # end

  # def update_conjured(item)
  #   item.sell_in > 0 ? item.quality -= 2 : item.quality -= 4
  #   item.quality = 50 if item.quality > 50
  #   item.quality = 0 if item.quality < 0
  #   item.sell_in -= 1
  # end

  # def update_brie(item)
  #   item.sell_in > 0 ? item.quality += 1 : item.quality += 2
  #   item.quality = 50 if item.quality > 50
  #   item.quality = 0 if item.quality < 0
  #   item.sell_in -= 1
  # end

  # def update_backstage(item)
  #   if item.sell_in > 10
  #     item.quality += 1
  #   elsif item.sell_in > 5
  #     item.quality += 2
  #   elsif item.sell_in > 0 
  #     item.quality += 3
  #   else
  #     item.quality = 0
  #   end
  #   item.quality = 50 if item.quality > 50
  #   item.quality = 0 if item.quality < 0
  #   item.sell_in -= 1
  # end

  def item_model(item)
    if item.name.include?('Sulfuras') 
      Sulfuras
    elsif item.name.include?('Aged Brie')
      Brie
    elsif item.name.include?('Backstage')
      Backstage
    elsif item.name.include?('Conjured')
      Conjured
    else
      Regular
    end
  end

  def update_quality()
    @items.each(&:update)

    # @items.each do |item|
    #   if item.name.include?('Sulfuras') 
    #     update_sulfuras(item)
    #   elsif item.name.include?('Aged Brie')
    #     update_brie(item)
    #   elsif item.name.include?('Backstage')
    #     update_backstage(item)
    #   elsif item.name.include?('Conjured')
    #     update_conjured(item)
    #   else
    #     update_regular(item)
    #   end
      # if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
      #   if item.quality > 0
      #     if item.name != "Sulfuras, Hand of Ragnaros"
      #       # reduce regular items by 1 
      #       item.quality = item.quality - 1
      #     end
      #   end
      # else
      #   if item.quality < 50
      #     item.quality = item.quality + 1
      #     if item.name == "Backstage passes to a TAFKAL80ETC concert"
      #       if item.sell_in < 11
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #       if item.sell_in < 6
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #     end
      #   end
      # end
      # # reduce sell in value
      # if item.name != "Sulfuras, Hand of Ragnaros"
      #   item.sell_in = item.sell_in - 1
      # end
      # if item.sell_in < 0
      #   if item.name != "Aged Brie"
      #     if item.name != "Backstage passes to a TAFKAL80ETC concert"
      #       if item.quality > 0
      #         if item.name != "Sulfuras, Hand of Ragnaros"
      #           item.quality = item.quality - 1
      #         end
      #       end
      #     else
      #       item.quality = item.quality - item.quality
      #     end
      #   else
      #     if item.quality < 50
      #       item.quality = item.quality + 1
      #     end
      #   end
      # end
    #end
  end
end
