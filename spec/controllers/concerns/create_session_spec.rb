require 'rails_helper'

RSpec.describe Api::V1::GraphqlController, type: :controller do
  include CreateSession

  describe '#jwt_session_create' do
    let(:user) { create(:user) }

    it 'returns a JWT token when session is created' do
      user = create(:user) # Use the factory to create a test user
      token = jwt_session_create(user.id)
      expect(token).not_to be_nil
    end

    it 'returns nil when user is not found' do
      token = jwt_session_create(-1)
      expect(token).to be_nil
    end

    it 'creates a token with correct user_id when user exists' do
      token = jwt_session_create(user.id)
      decoded_token = JsonWebToken.decode(token)
      expect(decoded_token['user_id']).to eq(user.id)
    end

    # it 'returns nil when session cannot be saved' do
    #   # Mocking the session creation to fail
    #   allow_any_instance_of(User).to receive_message_chain(:sessions, :build, :save).and_return(false)
    #   token = jwt_session_create(user.id)
    #   expect(token).to be_nil
    # end
  end
end
