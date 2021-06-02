class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.new(user_params)
    if user.valid? && user.authenticate(params[:user][:password])
      payload = {user_id: user.id}
      species = user.species
      genus = user.genus
      token = encode_token(payload)
      render json: {user: {id: user.id, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus, jwt: token}}
      user.save
    else
      render json: {errors: "Login Failed. Don't suck, just try again... but better this time.", message: user.errors.full_messages}.to_json
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
