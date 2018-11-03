class CreateEmprunts < ActiveRecord::Migration[5.2]
  def change
    create_table :emprunts do |t|
      t.date :date_debut
      t.date :date_fin
      t.text :avis
      t.integer :note
      t.references :user, foreign_key: true
      t.references :livre, foreign_key: true

      t.timestamps
    end
  end
end
