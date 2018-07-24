class SampleOrder < ApplicationRecord
  validates :order_unique_key, uniqueness: true
end
