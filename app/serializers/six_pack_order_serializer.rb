class SixPackOrderSerializer < ActiveModel::Serializer
  attributes :last_name, :first_name, :created_at, :email, :item_purchased, :item_description, :quantity, :price
end
