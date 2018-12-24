class HomeController < ApplicationController
  def index
    @livres = Livre.all
    @emprunts = Emprunt.where("note > '0'")
  end
end
