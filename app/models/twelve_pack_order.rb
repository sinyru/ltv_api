class TwelvePackOrder < ApplicationRecord
  validates :order_unique_key, uniqueness: true
end
