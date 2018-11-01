class UsersController < ApplicationController
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
      params.require(:user).permit(:prenom, :nom, :email, :photo)
  end

end
