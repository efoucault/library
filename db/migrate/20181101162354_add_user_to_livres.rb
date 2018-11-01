class AddUserToLivres < ActiveRecord::Migration[5.2]
  def change
    add_reference :livres, :user, foreign_key: true
  end
end
