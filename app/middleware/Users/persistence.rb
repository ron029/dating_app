module Users
  class Persistence
    attr_reader :current_user

    def initialize(current_user = nil)
      @current_user = current_user
    end

    def create(params)
      return current_user if current_user.present?

      user = User.create(
        first_name: params[:first_name], last_name: params[:last_name], mobile_number: params[:mobile_number],
        birthdate: params[:birthdate], gender: params[:gender], sexual_orientation: params[:sexual_orientation],
        gender_interest: params[:gender_interest],
        country: params[:country], state_region: params[:state_region], city: params[:city],
        school: params[:school], bio: params[:bio], email: params[:auth_provider]&.[](:credentials)&.[](:email),
        password: params[:auth_provider]&.[](:credentials)&.[](:password),
        password_confirmation: params[:auth_provider]&.[](:credentials)&.[](:password_confirmation)
      )
      user
    end

    def update(params)
      user = User.find(params[:id])
      user.update(
        first_name: params[:first_name], last_name: params[:last_name], mobile_number: params[:mobile_number],
        birthdate: params[:birthdate], gender: params[:gender], sexual_orientation: params[:sexual_orientation],
        gender_interest: params[:gender_interest],
        country: params[:country], state_region: params[:state_region], city: params[:city],
        school: params[:school], bio: params[:bio], email: params[:auth_provider]&.[](:credentials)&.[](:email),
        password: params[:auth_provider]&.[](:credentials)&.[](:password),
        password_confirmation: params[:auth_provider]&.[](:credentials)&.[](:password_confirmation)
      )
      user
    end

    def check_email(params)
      user = User.find_by(email: params[:email])
      user.nil? ? false : true
    end
  end
end
