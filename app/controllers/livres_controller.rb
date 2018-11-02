class LivresController < ApplicationController
  def index
    if params[:query].present?
      @livres = Livre.search_livres(params['query'])
    else
      @livres = Livre.all
    end
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

  def edit
    @livre = Livre.find(params[:id])
  end

  def update
    @livre = Livre.find(params[:id])
      if @livre.update(livre_params)
        redirect_to livre_path(@livre)
      else
       render :edit
      end
  end

  private

  def livre_params
    params.require(:livre).permit(:titre, :auteur, :video, :description, :user_id)
  end

end
