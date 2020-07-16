# frozen_string_literal: true

require 'item'

describe Item do
  it 'displays the item name, sell_in value and quality value' do
    item = Item.new('Item Name', 1, 2)
    expect { print item }.to output('Item Name, 1, 2').to_stdout
  end
end
