class User < ApplicationRecord
  has_many :livres
  mount_uploader :photo, VideoUploader
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
