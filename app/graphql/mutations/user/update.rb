module Mutations
  module User
    class Update < Mutations::AdminMutation
      graphql_name 'UpdateUser'

      class AuthProviderSignupData < Types::BaseInputObject
        graphql_name 'UpdateUser'
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end

      argument :id, ID, required: true
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :mobile_number, String, required: true
      argument :birthdate, GraphQL::Types::ISO8601Date, required: true
      argument :gender, String, required: true
      argument :sexual_orientation, String, required: true
      argument :gender_interest, String, required: true
      argument :country, String, required: true
      argument :state_region, String, required: true
      argument :city, String, required: true
      argument :school, String, required: false
      argument :bio, String, required: false
      argument :auth_provider, AuthProviderSignupData, required: true

      field :errors, [String], null: true
      field :user, Types::Models::UserType, null: true

      def resolve(params)
        user = Users::Persistence.new(current_user).update(params)
        {
          errors: user.errors.full_messages,
          user: user
        }
      end
    end
  end
end
