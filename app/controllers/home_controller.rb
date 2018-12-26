class HomeController < ApplicationController
  def index
    @livres = Livre.by_score.limit(3)
    @emprunts = Emprunt.where("note > '0'").order({updated_at: :desc}).limit(3)
  end
end
