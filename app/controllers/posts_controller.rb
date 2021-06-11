class PostsController < ApplicationController


  def create
    user = session_user
    post = Post.new(post_params)

    if params[:post][:image]
      post.images.attach(params[:file])
      image = url_for(post.image)
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

  def update
  end

  def delete
  end

  private

  def post_params(params)
    params.require( :post, :user_id, :image, :caption )
  end
end
