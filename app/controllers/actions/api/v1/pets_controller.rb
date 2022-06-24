# frozen_string_literal: true

module Actions
  module Api
    module V1
      class PetsController < Actions::Api::V1::ApplicationController
        before_action :set_pet, only: %i(update destroy adopted)

        def create
          pet_form = Pet::CreateForm.new(pet_params)

          if pet_form.valid? && pet_form.call
            render json: PetSerializer.new(pet_form.pet).serializable_hash.to_json, status: :created
          else
            render json: { errors: pet_form.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def update
          pet_form = Pet::UpdateForm.new(pet_params)

          if pet_form.valid? && pet_form.call(@pet)
            render json: { message: 'sucess!' }, status: :no_content
          else
            render json: { errors: pet_form.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          delete_service = Pet::DeleteService.new(pet: @pet)

          if delete_service.call
            render json: { message: 'sucess!' }, status: :no_content
          else
            render json: { error: pet_form.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def adopted
          adopted_service = Pet::AdoptedService.new(pet: @pet)

          if adopted_service.call
            render json: PetSerializer.new(@pet, params: { adopted_params: true }).serializable_hash.to_json, status: :ok
          else
            render json: { errors: @pet.errors.full_messages }, status: :unprocessable_entity
          end
        end

        private

        def pet_params
          params.require(:pet).permit(:name, :breed, :description, :url)
        end

        def set_pet
          @pet = PetRepository.find_by(id: params[:id])

          render_not_found if @pet.nil?
        end
      end
    end
  end
end
