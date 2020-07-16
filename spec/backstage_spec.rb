# frozen_string_literal: true

require 'backstage'

describe Backstage do
  it 'increases quality by 1 each day when sell_in value is greater than 10' do
    backstage = Backstage.new('Backstage passes to a TAFKAL80ETC concert', 12, 0)
    backstage.update
    expect(backstage.quality).to eq 1
  end

  it 'increases quality by 2 each day when sell_in value is 10 or less and greater than 5' do
    backstage = Backstage.new('Backstage passes to a TAFKAL80ETC concert', 7, 0)
    backstage.update
    expect(backstage.quality).to eq 2
  end

  it 'increases quality by 3 each day when sell_in value is 5 or less and greater than 0' do
    backstage = Backstage.new('Backstage passes to a TAFKAL80ETC concert', 4, 0)
    backstage.update
    expect(backstage.quality).to eq 3
  end

  it 'has a maximum quality of 50' do
    backstage = Backstage.new('Backstage passes to a TAFKAL80ETC concert', 4, 50)
    backstage.update
    expect(backstage.quality).to eq 50
  end

  it 'sets quality to 0 when sell_in value is 0 or less' do
    backstage = Backstage.new('Backstage passes to a TAFKAL80ETC concert', 2, 10)
    3.times { backstage.update }
    expect(backstage.quality).to eq 0
  end
end
