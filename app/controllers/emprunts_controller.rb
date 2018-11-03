class EmpruntsController < ApplicationController
  def index
    @emprunts = Emprunt.all
  end

  def show
    @livre = Livre.find(params[:livre_id])
    @emprunt = Emprunt.find(params[:id])
  end

  def new
    @livre = Livre.find(params[:livre_id])
    @emprunt = Emprunt.new
  end

  def create
    @emprunt = Emprunt.new(emprunt_params)
    @emprunt.livre = Livre.find(params[:livre_id])
    @emprunt.save!
    redirect_to livre_path(@emprunt.livre)
  end

  def edit
    @livre = Livre.find(params[:livre_id])
    @emprunt = Emprunt.find(params[:id])
  end

  def update
    @livre = Livre.find(params[:livre_id])
    @emprunt = Emprunt.find(params[:id])
      if @emprunt.update(emprunt_params)
        redirect_to livre_emprunt_path(@livre, @emprunt)
      else
       render :edit
      end
  end

  def destroy
    @emprunt = Emprunt.find(params[:id])
    @emprunt.destroy
    redirect_to livres_path
  end

end

private

def emprunt_params
  params.require(:emprunt).permit(:user_id, :date_debut, :date_debut, :avis, :note, :livre_id)
end
