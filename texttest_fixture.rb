#!/usr/bin/ruby -w

require_relative 'lib/gilded_rose'

puts 'OMGHAI!'

items_data = [
  { name: '+5 Dexterity Vest', sell_in: 10, quality: 20 },
  { name: 'Aged Brie', sell_in: 2, quality: 0 },
  { name: 'Elixir of the Mongoose', sell_in: 5, quality: 7 },
  { name: 'Sulfuras, Hand of Ragnaros', sell_in: 0, quality: 80 },
  { name: 'Sulfuras, Hand of Ragnaros', sell_in: -1, quality: 80 },
  { name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 15, quality: 20 },
  { name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 10, quality: 49 },
  { name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 5, quality: 49 },
  { name: 'Conjured Mana Cake', sell_in: 3, quality: 6 }
]

items = items_data.map { |item_data| Item.new(*item_data.values_at(:name, :sell_in, :quality)) }

days = ARGV.size.positive? ? ARGV[0].to_i + 1 : 2

gilded_rose = GildedRose.new items

days.times do |day|
  puts "-------- day #{day} --------"
  puts 'name, sellIn, quality'

  items.each do |item|
    puts item
  end

  puts ''

  gilded_rose.update_quality
end
