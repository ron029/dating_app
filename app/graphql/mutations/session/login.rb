module Mutations
  module Session
    class Login < BaseMutation
      include CreateSession
      graphql_name 'Login'
      null true

      argument :credentials, Types::AuthProviderCredentialsInput, required: false

      field :token, String, null: true
      field :user, Types::Models::UserType, null: true

      def resolve(credentials: nil)
        # basic validation
        return unless credentials

        user = ::User.find_by email: credentials[:email]

        return unless user
        return unless user.authenticate(credentials[:password])

        token = jwt_session_create user.id
        context[:session][:token] = token

        { user: user, token: token }
      end
    end
  end
end

        # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
        # crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        # token = crypt.encrypt_and_sign("user-id:#{user.id}")