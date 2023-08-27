# Frozen_string_literal: true

module Mutations
  module User
    class CreateUser < Mutations::BaseMutation
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end

      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :mobile_number, String, required: true
      argument :birthdate, GraphQL::Types::ISO8601Date, required: true
      argument :gender, String, required: true
      argument :sexual_orientation, String, required: true
      argument :country, String, required: true
      argument :state_region, String, required: true
      argument :city, String, required: true
      argument :school, String, required: false
      argument :bio, String, required: false
      argument :auth_provider, AuthProviderSignupData, required: true

      type Types::Models::UserType

      def resolve(options)
        options = {
          first_name: options[:first_name], last_name: options[:last_name], mobile_number: options[:mobile_number],
          birthdate: options[:birthdate], gender: options[:gender], sexual_orientation: options[:sexual_orientation],
          country: options[:country], state_region: options[:state_region], city: options[:city],
          school: options[:school], bio: options[:bio], email: options[:auth_provider]&.[](:credentials)&.[](:email),
          password: options[:auth_provider]&.[](:credentials)&.[](:password),
          password_confirmation: options[:auth_provider]&.[](:credentials)&.[](:password_confirmation)
        }
        User.create!(options)
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
