class Pet::CreateForm < Pet::BaseForm
  attr_reader :pet

  def call
    return false if invalid?

    rescuing_errors do
      create_service = Pet::CreateService.new(params: base_params)
      create_service.call

      self.pet = create_service.pet
    end
  end
end

