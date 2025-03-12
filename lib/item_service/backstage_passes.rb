module ItemService
  class BackstagePasses < Normal
    protected

    def updated_quality
      item.sell_in.negative? ? Normal::MIN_QUALITY : item.quality + update_quality_value
    end

    def update_quality_value
      case item.sell_in
      when (10..)
        1
      when 5...10
        2
      when 0...5
        3
      end
    end
  end
end
