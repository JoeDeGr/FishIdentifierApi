class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.new(user_params)
    if user.valid? && user.authenticate(params[:user][:password])
      payload = {user_id: user.id}
      species = user.species
      genus = user.genus
      token = encode_token(payload)
      user.save
      render json: {user: {id: user.id, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus, jwt: token}}
    else
      render json: {errors: "Login Failed. Don't suck, just try again... but better this time.", message: user.errors.full_messages}.to_json
    end
  end

  def show
  end

  def update
    user = User.find_by(user_params)
  end

  def image_upload
    user = session_user
    if params[:file]
      user.images.attach(params[:file])
      image = url_for(user.image)
    else params[:camera]
      blob=ActiveStorage::Blob.create_after_upload!(
        io:StringIO.new(Base64.decode64(params[:camera].split(",")[1])),
        filename:"user.png",
        content_type:"image/png",
      )
      user.images.attach(blob)
      photo=url_for(user.photo)
    # else
    #   #store the raw data?
    #   image = image_params[@user.image]
    end

    if user.update(photo: photo)
      render json: {user: {id: user.id, name: user.name, username: user.username, user_species: user.species, user_genus: user.genus, user_images: user.images, jwt: token}}
    end
  end 

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
