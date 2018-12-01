class AddEnvoiHebdotoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :notif_hebdo, :boolean, default: false
  end
end
