namespace :emprunt do
  desc "Envoi de mail de relance"
  task relance: :environment do
    EmpruntMailer.relance.deliver_now
  end

end
