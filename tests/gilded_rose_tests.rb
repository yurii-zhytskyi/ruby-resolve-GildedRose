require 'minitest/autorun'
require_relative '../lib/gilded_rose'

class TestGildedRose < Minitest::Test
  def test_foo
    items = [Item.new('foo', 0, 0)]

    GildedRose.new(items).update_quality

    assert_equal 'foo', items[0].name
  end
end
