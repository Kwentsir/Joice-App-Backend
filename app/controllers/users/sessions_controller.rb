class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    if resource.errors.empty?
    render json: { status: 200, message: 'Login successfully!', user: current_user }, status: :ok
    else
      render json: { status: 401, message: 'Login failed', errors: resource.errors.full_messages },
             status: :unathorized
    end
  end

  def user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                             Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])
  end

  def respond_to_on_destroy
    current_user = user_from_token

    if current_user
      render json: { status: 200, message: 'User logged out successfully' }, status: :ok
    else
      render json: { status: 401, message: 'Fail to logout user', errors: resource.errors.full_messages },
             status: :unprocessable_entity
    end
  end
end
