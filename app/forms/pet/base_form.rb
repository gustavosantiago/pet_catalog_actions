# frozen_string_literal: true

class Pet::BaseForm < ApplicationForm
  include ShallowAttributes

  attr_accessor :pet

  attribute :name, String
  attribute :breed, String
  attribute :description, String
  attribute :url, String

  validates :name, :breed, :description, :url, presence: true
  validates :breed, length: { maximum: 25 }
  validates :description, length: { maximum: 250 }
  validates_format_of :url, with: /((?=[a-z0-9-]{1,63}\.)[a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,63}/

  private

  def base_params
    {
      name: name,
      breed: breed,
      description: description,
      url: url,
    }
  end
end
