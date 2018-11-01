class Livre < ApplicationRecord
  belongs_to :user
  mount_uploader :video, VideoUploader

  include PgSearch
  pg_search_scope :search_livres,
    against: [ :titre, :auteur ],
    associated_against: {
      user: [ :prenom, :nom ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
