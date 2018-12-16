class Livre < ApplicationRecord
  belongs_to :user
  has_many :emprunts
  has_many :likes, dependent: :destroy
  mount_uploader :video, VideoUploader
  validates :user, :titre, presence: true

  include PgSearch
  pg_search_scope :search_livres,
    against: [ :titre, :auteur ],
    associated_against: {
      user: [ :prenom, :nom ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def titre_auteur
    "#{titre} - #{auteur}"
  end
end
