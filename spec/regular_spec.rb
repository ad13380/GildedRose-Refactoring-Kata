# frozen_string_literal: true

require 'regular'

describe Regular do
  it 'decreases quality by 1 each day when sell_in value is greater than 0' do
    regular = Regular.new('A regular Item', 2, 10)
    regular.update
    expect(regular.quality).to eq 9
  end

  it 'decreases quality by 2 each day when sell_in value is 0 or less' do
    regular = Regular.new('A regular Item', 0, 10)
    regular.update
    expect(regular.quality).to eq 8
  end

  it 'has a minimum quality of 0' do
    regular = Regular.new('A regular Item', 0, 10)
    6.times { regular.update }
    expect(regular.quality).to eq 0
  end
end
