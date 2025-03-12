module ItemService
  class Conjured < Normal
    protected

    def update_quality_value
      super * 2
    end
  end
end
