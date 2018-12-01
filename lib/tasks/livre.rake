namespace :livre do
  desc "Envoi de mail hebdo"
  task envoi_notif: :environment do
    @livres = Livre.select{ |livre| livre.created_at > (Time.now - (7*24*60*60)) }
    if Date.today.monday? && @livres.length > 0
      LivreMailer.nouveautes.deliver_now
    end
  end
end
