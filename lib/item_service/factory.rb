require_relative 'normal'
require_relative 'aged_brie'
require_relative 'backstage_passes'
require_relative 'sulfuras'
require_relative 'conjured'

module ItemService
  class Factory
    def initialize(item)
      @item = item
    end

    def create_item_service
      item_service.new(item)
    end

    private

    attr_reader :item

    def item_service
      @item_service ||=
        case item.name
        when 'Aged Brie'
          ItemService::AgedBrie
        when 'Sulfuras, Hand of Ragnaros'
          ItemService::Sulfuras
        when 'Backstage passes to a TAFKAL80ETC concert'
          ItemService::BackstagePasses
        when 'Conjured Mana Cake'
          ItemService::Conjured
        else
          ItemService::Normal
        end
    end
  end
end
