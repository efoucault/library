class EmpruntsController < ApplicationController

  def index
    if params[:livre_id]
      @emprunts = Livre.find(params[:livre_id]).emprunts
    else
      @emprunts = Emprunt.all
    end
  end

  def show
    @livre = Livre.find(params[:livre_id])
    @emprunt = Emprunt.find(params[:id])
    raise
  end

  def new
    @livre = Livre.find(params[:livre_id])
    @emprunt = Emprunt.new
    @emprunt.user = current_user
    @emprunt.livre = @livre
    @emprunt.date_debut = DateTime.now
  end

  def create
    @emprunt = Emprunt.new(emprunt_params)
    @emprunt.livre = Livre.find(params[:livre_id])
    if @emprunt.save
      @emprunt.save!
      if @emprunt.livre.user.livre_emprunte == true
        EmpruntMailer.emprunt(@emprunt).deliver_now
      end
      redirect_to livre_path(@emprunt.livre)
    else
      render :edit
    end
  end

  def edit
    @livre = Livre.find(params[:livre_id])
    @emprunt = Emprunt.find(params[:id])
  end

  def update
    @livre = Livre.find(params[:livre_id])
    @emprunt = Emprunt.find(params[:id])
    if @emprunt.update(emprunt_params)
      if @emprunt.note != nil
        if @emprunt.livre.user.livre_rendu == true
          EmpruntMailer.rendu(@emprunt).deliver_now
        end
      end
      redirect_to livre_path(@emprunt.livre)
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
  params.require(:emprunt).permit(:user_id, :date_debut, :date_fin, :avis, :note, :livre_id)
end
