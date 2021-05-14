class UsersController < ApplicationController
  def create
    user = User.find_by(user_params) || User.new(user_params)
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
