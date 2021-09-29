class Video < ApplicationRecord
  belongs_to :machine_part, optional: true
  validates_associated :videos
end
