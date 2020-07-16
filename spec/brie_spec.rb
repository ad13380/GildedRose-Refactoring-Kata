# frozen_string_literal: true

require 'brie'

describe Brie do
  it 'increases quality by 1 each day when sell_in value is greater than 0' do
    brie = Brie.new('Aged Brie', 2, 0)
    brie.update
    expect(brie.quality).to eq 1
  end

  it 'increases quality by 2 each day when sell_in value is 0 or less' do
    brie = Brie.new('Aged Brie', 0, 0)
    4.times { brie.update }
    expect(brie.quality).to eq 8
  end

  it 'has a maximum quality of 50' do
    brie = Brie.new('Aged Brie', 0, 0)
    26.times { brie.update }
    expect(brie.quality).to eq 50
  end
end
