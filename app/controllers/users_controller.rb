class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to edit_user_path, notice: 'Profil was successfully updated.'
      else
       render :edit
      end
  end

  private

  def user_params
      params.require(:user).permit(:prenom, :nom, :email, :photo, :livre_emprunte, :livre_rendu, :notif_hebdo)
  end

end
