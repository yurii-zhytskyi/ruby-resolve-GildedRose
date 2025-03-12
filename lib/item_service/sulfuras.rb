module ItemService
  class Sulfuras < Normal
    MAX_QUALITY = 80

    def update!
      item.quality = MAX_QUALITY
    end
  end
end
