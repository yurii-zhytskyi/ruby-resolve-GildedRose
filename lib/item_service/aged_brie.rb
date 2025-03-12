module ItemService
  class AgedBrie < Normal
    protected

    def updated_quality
      item.quality + update_quality_value
    end
  end
end
