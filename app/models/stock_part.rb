class StockPart < ApplicationRecord
validates :stock_parts_name, presence: true
validates :model,            presence: true
validates :maker,            presence: true
validates :stock,            presence: true
validates :price,            presence: true

end
