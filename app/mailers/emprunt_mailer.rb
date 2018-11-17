class EmpruntMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.emprunt_mailer.emprunt.subject
  #
  def emprunt(emprunt)
    @user = emprunt.user
    @livre = emprunt.livre

    mail(to: @livre.user.email, subject: 'Ton livre a été emprunté')
  end

  def rendu(emprunt)
    @user = emprunt.user
    @livre = emprunt.livre

    mail(to: @livre.user.email, subject: 'Ton livre a été noté')
  end
end
