class Emprunt < ApplicationRecord
  belongs_to :user
  belongs_to :livre
  # validates :note, numericality: { greater_than: 0 }
  # validates :note, numericality: { less_than: 6 }
  validates :date_debut, presence: true
end
