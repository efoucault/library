class LivreMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.livre_mailer.nouveautes.subject
  #
  def nouveautes
    @livres = Livre.select{ |livre| livre.created_at > (Time.now - (7*24*60*60)) }
    mail to: "efoucault@gmail.com"
  end
end
