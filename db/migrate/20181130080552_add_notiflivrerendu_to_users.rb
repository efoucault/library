class AddNotiflivrerenduToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :livre_rendu, :boolean, default: true
  end
end
