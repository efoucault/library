# Preview all emails at http://localhost:3000/rails/mailers/livre_mailer
class LivreMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/livre_mailer/nouveautes
  def nouveautes
    LivreMailer.nouveautes
  end

end
