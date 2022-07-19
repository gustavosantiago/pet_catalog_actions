class Pet::UpdateForm < Pet::BaseForm
  attr_reader :pet

  def call(pet)
    return false unless valid?(:update)

    rescuing_errors do
      update_service = Pet::UpdateService.new(pet: pet, params: update_params)
      update_service.call
    end
  end

  private

  def update_params
    base_params.compact
  end
end