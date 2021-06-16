class GenusController < ApplicationController
  skip_before_action :require_login

  def show
    genus = Genus.all
    render json: { genus: genus }
  end
end
