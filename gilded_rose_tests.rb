#require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'
require_relative 'lib/gilded_rose.rb'

class TestUntitled < Test::Unit::TestCase

  def test_foo
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].name, "fixme"
  end

end