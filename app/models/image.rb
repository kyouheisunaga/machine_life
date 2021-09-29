class Image < ApplicationRecord
  belongs_to :machine_part, optional: true
  mount_uploader :image, ImageUploader
end
