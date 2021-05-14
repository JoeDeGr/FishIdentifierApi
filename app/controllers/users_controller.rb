class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.valid? && user.authenticate(params[:user][:password])
      binding.pry
      species = user.species
      genus = user.genus
      render json: {user: user, species: species, genus: genus}
      user.save
    else
      render json: {errors: "Login Failed. Don't suck, just try again... but better this time."}.to_json
    end
  end

  def show
  end

  def update
    user = User.find_by(user_params)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
