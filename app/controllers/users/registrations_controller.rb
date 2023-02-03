class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { status: 200, message: 'Signed up successfully', data: resource }, status: :ok
    else
      render json: { message: 'Fail to register user', errors: resource.errors.full_messages },
             status: :unprocessable_entity
    end
  end
end
