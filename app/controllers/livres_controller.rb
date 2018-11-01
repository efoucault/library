class LivresController < ApplicationController
  def index
    @livres = Livre.all
  end

  def show
    @livre = Livre.find(params[:id])
  end

  def new
    @livre = Livre.new
  end

  def create
    @livre = Livre.new(livre_params)
    @livre.save!
    redirect_to livre_path(@livre)
  end

  private

  def livre_params
    params.require(:livre).permit(:titre, :auteur, :video, :description, :user_id)
  end

end
