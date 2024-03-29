# frozen_string_literal: true

class Pet::CreateService
  attr_reader :pet, :params

  def initialize(params:)
    @params = params
  end

  def call
    @pet = Pet.new(@params)
    @pet.save!
  rescue StandardError => e
    raise(e)
  end
end

