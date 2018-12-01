class LivreMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.livre_mailer.nouveautes.subject
  #
  def nouveautes
    @users = User.select{ |user| user.notif_hebdo == true }
    @livres = Livre.select{ |livre| livre.created_at > (Time.now - (7*24*60*60)) }
    emails = @users.collect(&:email).join(",")
    mail(:to => emails, :subject => "Des nouveaux livres dans la bibliothèque")
  end
end
