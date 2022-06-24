# frozen_string_literal: true

class Pet::UpdateService
  attr_reader :pet, :params

  def initialize(pet:, params:)
    @pet = pet
    @params = params
  end

  def call
    @pet.update!(params)
    @pet.save!
  rescue StandardError => e
    raise(e)
  end
end

