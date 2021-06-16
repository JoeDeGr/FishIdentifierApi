class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create, :update]

  def create
    user = User.new(user_params)
    if user.valid? && user.authenticate(params[:user][:password])
      payload = {user_id: user.id}
      species = user.species
      genus = user.genus
      token = encode_token(payload)
      user.save
      render json: {user: {id: user.id, email: user.email, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus, jwt: token}}
    else
      render json: {errors: "Login Failed. Don't suck, just try again... but better this time.", message: user.errors.full_messages}.to_json
    end
  end

  def show
  end

  def update
    user = User.find_by(email: user_params[:email])
    if (user.valid?) && (user === session_user)
      user_attributes = user_params.delete(:password)
      user.update(user_params)
      payload = {user_id: user.id}
      species = user.species
      genus = user.genus
      token = encode_token(payload)
      user.save
      render json: {user: {id: user.id, email: user.email, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus, jwt: token}}
    else
      render json: {errors: "Login Failed. Don't suck, just try again... but better this time.", message: user.errors.full_messages}.to_json
    end
  end

  def add_species
    if session_user
      user = session_user
      species = Species.find_by_id(params[:species][:id])
      if !user.species.include?(species)
        user.species.push(species)
        user.save
      end
      render json: {user: {id: user.id, email: user.email, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus}}
    else
      render json: {errors: "Login Failed. Don't suck, just try again... but better this time."}.to_json
    end
  end

  def add_genus
    if session_user
      user = session_user
      genus = Genus.find_by_id(params[:genus][:id])
      if !user.genus.include?(genus)

        user.genus.push(genus)
        user.save
      end
      render json: {user: {id: user.id, email: user.email, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus}}
    else
      render json: {errors: "Login Failed. Don't suck, just try again... but better this time."}.to_json
    end
  end

  def remove_species
    if session_user
      user = session_user
      species = Species.find_by_id(params[:species][:id])
      if !user.species.include?(species)
        user.species.delete(species)
        user.save
      end
      render json: {user: {id: user.id, email: user.email, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus}}
    else
      render json: {errors: "Login Failed. Don't suck, just try again... but better this time."}.to_json
    end
  end

  def remove_genus
    if session_user
      user = session_user
      genus = Genus.find_by_id(params[:genus][:id])
      if user.genus.include?(genus)
        user.genus.delete(genus)
        binding.pry
        user.save
      end
      render json: {user: {id: user.id, email: user.email, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus}}
    else
      render json: {errors: "Login Failed. Don't suck, just try again... but better this time."}.to_json
    end
  end

  # def image_upload
  #   user = session_user
  #   if params[:file]
  #     user.images.attach(params[:file])
  #     image = url_for(user.image)
  #   else params[:camera]
  #     blob=ActiveStorage::Blob.create_after_upload!(
  #       io:StringIO.new(Base64.decode64(params[:camera].split(",")[1])),
  #       filename:"user.png",
  #       content_type:"image/png",
  #     )
  #     user.images.attach(blob)
  #     photo=url_for(user.photo)
  #   # else
  #   #   #store the raw data?
  #   #   image = image_params[@user.image]
  #   end

  #   if user.update(photo: photo)
  #     render json: {user: {id: user.id, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus, user_images: user.images, jwt: token}}
  #   end
  # end 

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :user_species, :user_genus)
  end
end
