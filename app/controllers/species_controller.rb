class SpeciesController < ApplicationController
  skip_before_action :require_login

  def show
    species = Species.all
    render json: {species: species}
  end
end
