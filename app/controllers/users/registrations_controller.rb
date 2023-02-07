class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  respond_to :json

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { status: :created, message: 'Signed up successfully', data: resource }, status: :created
    else
      render json: {status: :unprocessable_entity, message: 'Fail to register user', errors: resource.errors.full_messages }
             
    end
  end
end
