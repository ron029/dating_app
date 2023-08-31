# frozen_string_literal: true

module Queries
  class Base < GraphQL::Schema::Resolver
    protected

    def authorize_user
      return true if current_user.present?

      raise GraphQL::ExecutionError, 'User not signed in'
    end

    def current_user
      context[:current_user]
    end
  end
end
