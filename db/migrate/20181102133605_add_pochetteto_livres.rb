class AddPochettetoLivres < ActiveRecord::Migration[5.2]
  def change
    add_column :livres, :pochette, :string
  end
end
