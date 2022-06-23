class Discovery::Api::V1::PetsController < Discovery::Api::V1::ApplicationController
  def create
    @pet = Pet::CreateForm.call(pet_params)

    render json: PetSerializer.new(@pets).serializable_hash.to_json, status: :ok
  end

  private

  def pet_params
    params.permit(:name, :breed, :description, :url)
  end
end
