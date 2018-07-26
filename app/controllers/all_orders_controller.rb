class AllOrdersController < ApplicationController
  def index
    render json: AllOrder.order(:last_name, :first_name, :created_at)
  end

  def create
    @all_order = AllOrder.create(all_order_params)

    if @all_order.save
      render json: @all_order, status: :created
    else
      render json: @all_order.errors, status: :unprocessable_entity
    end
  end

  def all_order_params
    params.require(:all_order).permit(:order_id,:customer_id,:created_at,:item_purchased,
      :email, :first_name, :last_name, :item_description, :price, :quantity, :order_unique_key)
  end
end
