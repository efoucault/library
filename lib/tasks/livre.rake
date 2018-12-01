namespace :livre do
  desc "Envoi de mail hebdo"
  task envoi_notif: :environment do
    # if Date.today.monday?
      LivreMailer.nouveautes.deliver_now
    # end
  end
end
