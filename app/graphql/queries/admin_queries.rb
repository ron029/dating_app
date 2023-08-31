# frozen_string_literal: true

module Queries
  class AdminQueries < Queries::Base
    def ready?(**_args)
      return true if context[:current_user].admin?

      raise GraphQL::ExecutionError, 'Not allowed'
    end
  end
end
