class Machine < ApplicationRecord
  belongs_to :user
  has_many :machine_parts, dependent: :destroy

  # 設備新規登録で稼働系時間の欄に何も入力されなかった場合に発動する
  before_validation :set_integerless_operating_time

  private

  def set_integerless_operating_time
    # selfが整数を代入できるかわからない
    self.machine_operating_time_accumulation = 0 if machine_operating_time_accumulation.blank?
  end

end
