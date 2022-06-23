class Pet::CreateForm < Pet::BaseForm
  def create(pet:)
    @pet = pet

    return false if invalid?

    rescuing_errors { create_pet }
  end

  private

  def create_responsible_profile
    transaction do
      @pet = Pet::CreateService(params: base_params)
    end
  end
end

