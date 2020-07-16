# frozen_string_literal: true

require 'conjured'

describe Conjured do
  it 'decreases quality by 2 each day when sell_in value is greater than 0' do
    conjured = Conjured.new('Conjured', 2, 10)
    conjured.update
    expect(conjured.quality).to eq 8
  end

  it 'decreases quality by 4 each day when sell_in value is greater than 0' do
    conjured = Conjured.new('Conjured', 0, 10)
    conjured.update
    expect(conjured.quality).to eq 6
  end

  it 'has a minimum quality of 0' do
    conjured = Conjured.new('Conjured', 0, 10)
    6.times { conjured.update }
    expect(conjured.quality).to eq 0
  end
end
