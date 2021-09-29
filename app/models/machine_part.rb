class MachinePart < ApplicationRecord
  belongs_to :machine
  belongs_to :stock_part
  belongs_to :user
  has_one :video, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :exchange_historys, dependent: :destroy

  validates_associated :images

  validates :number_of_use,                             presence: true
  validates :replacement_frequency_setting,             presence: true
  validates :machine_parts_operating_time_accumulation, presence: true
  validates :exchange_announcement,                     presence: true
  validates :order_announcement,                        presence: true

  accepts_nested_attributes_for :images, allow_destroy: true

end
