module Types
  module Models
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :first_name, String, null: false
      field :last_name, String, null: false
      field :mobile_number, String, null: false
      field :email, String, null: false
      field :birthday, GraphQL::Types::ISO8601Date, null: false
      field :gender, String, null: false
      field :sexual_orientation, String, null: false
      field :country, String, null: false
      field :state_region, String, null: false
      field :city, String, null: false
      field :school, String, null: true
      field :bio, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
