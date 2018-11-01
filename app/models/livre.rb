class Livre < ApplicationRecord
  mount_uploader :video, VideoUploader
end
