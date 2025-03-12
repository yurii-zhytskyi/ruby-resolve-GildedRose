module ItemService
  class Normal
    MIN_QUALITY = 0
    MAX_QUALITY = 50
    DEFAULT_UPDATE_QUALITY_VALUE = 1

    def initialize(item)
      @item = item
    end

    def update!
      update_sell_in!
      update_quality! if need_update_quality?
    end

    protected

    attr_reader :item

    def update_sell_in!
      item.sell_in -= 1
    end

    def update_quality!
      quality = updated_quality

      quality = MIN_QUALITY if quality.negative?
      quality = MAX_QUALITY if quality > MAX_QUALITY

      item.quality = quality
    end

    def updated_quality
      item.quality - update_quality_value
    end

    def update_quality_value
      item.sell_in.negative? ? DEFAULT_UPDATE_QUALITY_VALUE * 2 : DEFAULT_UPDATE_QUALITY_VALUE
    end

    def need_update_quality?
      item.quality >= MIN_QUALITY && item.quality <= MAX_QUALITY
    end
  end
end
