class PetRepository
  class << self
    def find_by(*attrs)
      Pet.find_by(*attrs)
    end

    def with_photos(*attrs)
      Pet.where.not(url: nil).order(id: :desc).limit(itens(attrs[0]))
    end

    private

    def itens(params)
      params[:limit].present? ? params[:limit] : 10
    end
  end
end