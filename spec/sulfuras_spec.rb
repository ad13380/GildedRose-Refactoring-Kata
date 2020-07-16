# frozen_string_literal: true

require 'sulfuras'

describe Sulfuras do
  it 'does not decrease in quality' do
    sulfuras = Sulfuras.new('Sulfuras, Hand of Ragnaros', 2, 10)
    sulfuras.update
    expect(sulfuras.quality).to eq 10
  end

  it 'does not decrease in sell_in value' do
    sulfuras = Sulfuras.new('Sulfuras, Hand of Ragnaros', 2, 10)
    sulfuras.update
    expect(sulfuras.sell_in).to eq 2
  end
end
