class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id] )
    render json: @user, status: :ok
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { message: 'Failed to update user', errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :profile_picture)
  end
end
