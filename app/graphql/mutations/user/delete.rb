# frozen_string_literal: true

module Mutations
  module User
    class Delete < Mutations::AdminMutation
      graphql_name 'DeleteUser'

      argument :id, ID, required: true

      field :errors, [String], null: true
      field :message, String, null: false

      def resolve(id:)
        user = ::User.find_by(id: id)

        if user
          user.destroy
          {
            errors: user.errors.full_messages,
            message: user.destroyed?
          }
        else
          {
            errors: ["id: #{id}", 'User not found'],
            message: ''
          }
        end
      end
    end
  end
end
