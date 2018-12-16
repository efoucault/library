class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
    else
      @livre.likes.create(user_id: current_user.id)
      redirect_to livres_path
    end
  end

  def destroy
    @like.destroy
    redirect_to livres_path
  end

  private

  def find_post
    @livre = Livre.find(params[:livre_id])
  end

  def find_like
     @like = @livre.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, livre_id:
    params[:livre_id]).exists?
  end

end
