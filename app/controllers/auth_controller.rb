class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login]
    def login
        user = User.find_by(username: user_params[:username])
        if user && user.authenticate(user_params[:password])
            payload = { user_id: user.id }
            token = encode_token(payload)
            species = user.species
            genus = user.genus
            render json: {user: {id: user.id, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus, jwt: token}}
        else
            render json: {errors: "Login Failed. Don't suck, just try again... but better this time."}.to_json
        end
    end


    def auto_login
        if session_user
            binding.pry
            user = @user
            render json: {user: {id: user.id, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus}}
        else
            render json: {errors: "Login Failed. Don't suck, just try again... but better this time."}.to_json
        end
    end

    

    private

    def user_params
      params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
    end

end
