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

  def relance
    @emprunts = Emprunt.select{ |emprunt| emprunt.user == 1 }
    # @emprunts = Emprunt.select{ |emprunt| emprunt.note == nil && emprunt.date_fin == nil && emprunt.created_at < (Time.now - (30*24*60*60)) }
    @emprunts.each do |emprunt|
      @user = emprunt.user
      @livre = emprunt.livre
      mail(to: @user.email, subject: "Tu n'as pas encore fini ta lecture ?")
    end
  end
end
