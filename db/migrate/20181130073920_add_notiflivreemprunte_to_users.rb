class AddNotiflivreemprunteToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :livre_emprunte, :boolean, default: true
  end
end
