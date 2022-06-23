# frozen_string_literal: true

class Pets::BaseForm < ApplicationForm
  include ShallowAttributes
  extend Enumerize

  attr_accessor :pet

  attribute :name, String
  attribute :breed, String
  attribute :description, String
  attribute :url, String

  validates :name, :breed, :description, :url, presence: true
  validates :breed, length: { maximum: 25 }
  validates :description, length: { maximum: 250 }

  def new_record?
    return true if pet.nil?

    pet.new_record?
  end

  private

  def base_attributes
    {
      name: name,
      breed: breed,
      description: description,
      url: url,
    }
  end
end
