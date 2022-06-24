# frozen_string_literal: true

# Module responsible to provide ActiveRecord transaction with more improvements
#
# @example
#
# class Bmodel < AplicationRecord
#   validates :name, presence: true
# end
#
# class CModel < ApplicationRecord
# end
#
# class AClass
#   include Transactable
#
#   def transactable_method
#     transaction do
#       BModel.create
#       CModel.create
#     end
#   end
# end
#
# AClass.new.transactable_method
# Bmodel.count #=> 0
# CModel.count #=> 0
module Transactable
  def without_transaction
    @without_transaction = true
    self
  end

  private

  def transaction(options = {})
    klass = options.delete(:class) { ApplicationRecord }

    raised_exception = nil

    return yield if @without_transaction

    klass.transaction(options) do
      begin
        yield
      rescue ActiveRecord::Rollback
        # We must recue the rollback so the Exception clause does not catch it.
        rollback_transaction!
      rescue Exception => e
        raised_exception = e
        rollback_transaction!
      end
    end.tap { raise raised_exception if raised_exception.present? }
  end

  def rollback_transaction!
    raise ActiveRecord::Rollback
  end
end
