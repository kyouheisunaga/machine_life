class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :machines, dependent: :destroy
  has_many :stock_parts, dependent: :destroy
  has_many :machine_parts, dependent: :destroy

  validates :nickname, presence: true

end
