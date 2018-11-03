class Emprunt < ApplicationRecord
  belongs_to :user
  belongs_to :livre
end
