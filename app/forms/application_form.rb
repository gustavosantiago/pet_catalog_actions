# frozen_string_literal: true

# @abstract true
class ApplicationForm
  include ActiveModel::Model
  include Transactable

  def attributes
    as_json
  end

  def validate
    valid?
    errors.empty?
  end

  def rescuing_errors
    yield
  rescue StandardError => e
    errors.add(:base, e.message)

    false
  end
end