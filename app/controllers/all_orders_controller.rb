class AllOrdersController < ApplicationController
  def index
    render json: AllOrder.order(:last_name, :first_name, :created_at)
  end

  def create
    AllOrder.create(all_order_params)
  end

  def all_order_params
    params.require(:all_order).permit(:order_id,:customer_id,:created_at,:variant_title,
      :email, :first_name, :last_name, :product_title, :price, :quantity, :order_unique_key, :item_type)
  end
end
