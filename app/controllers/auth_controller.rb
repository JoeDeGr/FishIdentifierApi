class AuthController < ApplicationController
    def login
        user = User.find_by(username: user_params[:username])
        if user && user.authenticate(user_params[:password])
            payload = { user_id: user.id }
            token = encode_token(payload)
            species = user.species
            genus = user.genus
            render json: {user: user, user_species: species, user_genus: genus, jwt: token}
        else
            render json: {errors: "Login Failed. Don't suck, just try again... but better this time."}.to_json
        end
    end


    def auto_login
        if session_user
            
            user = @user
            render json: {user: user, user_species: user.species, user_genus: user.genus}
        else
            render json: {errors: "Login Failed. Don't suck, just try again... but better this time."}.to_json
        end
    end

    

    private

    def user_params
      params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
    end

end
