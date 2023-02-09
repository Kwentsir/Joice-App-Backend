class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # respond_to :json

  def create
    @user = User.new(sign_up_params)

    if @user.save!
      @token = @user.generate_jwt
      access_token = AccessToken.new(token: @token, user: @user)
      if access_token.save!
        render json: 
        { status: :created, message: 'Signed up successfully', data: {user: @user, token: @token} }, status: :created
      else
        @user.destroy
        render json: { errors: 'User could not be registered' }, status: :unprocessable_entity
      end
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  # def respond_with(resource, _opts = {})
  #   if resource.persisted?
  #     render json: { status: :created, message: 'Signed up successfully', data: resource }, status: :created
  #   else
  #     render json: {status: :unprocessable_entity, message: 'Fail to register user', errors: resource.errors.full_messages }              
  #   end
  # end
end
