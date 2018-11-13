# Preview all emails at http://localhost:3000/rails/mailers/emprunt_mailer
class EmpruntMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/emprunt_mailer/emprunt
  def emprunt
    EmpruntMailer.emprunt
  end

end
