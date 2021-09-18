class MachinePart < ApplicationRecord
  belongs_to :machine
  belongs_to :stock_part
  has_one :video, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :exchange_historys, dependent: :destroy
end
