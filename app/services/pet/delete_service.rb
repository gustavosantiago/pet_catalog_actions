# frozen_string_literal: true

class Pet::DeleteService
  attr_reader :pet

  def initialize(pet:)
    @pet = pet
  end

  def call
    pet.destroy!
  rescue StandardError => e
    raise e
  end
end

