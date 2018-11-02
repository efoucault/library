class User < ApplicationRecord
  has_many :livres
  validate :email_domain
  mount_uploader :photo, VideoUploader
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def prenom_nom
  "#{prenom} #{nom}"
  end

  def email_domain
    domain = email.split("@").last
    if !email.blank?
      errors.add(:email, "Invalid Domain") if domain != "twelve-consulting.com"
    end
  end
end
