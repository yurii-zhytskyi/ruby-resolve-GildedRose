require_relative 'item'
require_relative 'item_service/factory'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    item_services.each(&:update!)
  end

  private

  attr_reader :items

  def item_services
    @item_services ||= items.map do |item|
      ItemService::Factory.new(item).create_item_service
    end
  end
end
