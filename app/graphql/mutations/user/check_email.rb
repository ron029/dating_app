# Frozen_string_literal: true

module Mutations
  module User
    class CheckEmail < BaseMutation
      graphql_name 'CheckEmail'
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      argument :email, String, required: true

      field :user, Boolean, null: true

      def resolve(params)
        user = Users::Persistence.new.check_email(params)
        {
          user: user
        }
      end
    end
  end
end
