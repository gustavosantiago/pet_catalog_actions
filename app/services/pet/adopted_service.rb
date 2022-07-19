# frozen_string_literal: true

class Pet::AdoptedService
  attr_reader :pet

  def initialize(pet:)
    @pet = pet   
  end

  def call
    @pet.update!(adopted: true, owner: Faker::Movies::StarWars.character)
  rescue StandardError => e
    raise(e)
  end
end

