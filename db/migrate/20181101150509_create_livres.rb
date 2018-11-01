class CreateLivres < ActiveRecord::Migration[5.2]
  def change
    create_table :livres do |t|
      t.string :titre
      t.string :auteur
      t.text :description
      t.string :video

      t.timestamps
    end
  end
end
