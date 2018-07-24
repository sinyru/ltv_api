class SixPackOrdersController < ApplicationController
  def index
    render json: SixPackOrder.order(:last_name, :first_name, :created_at)
  end

  def create
    @six_pack_order = SixPackOrder.create(six_pack_order_params)

    if @six_pack_order.save
      render json: @six_pack_order, status: :created
    else
      render json: @six_pack_order.errors, status: :unprocessable_entity
    end
  end

  def six_pack_order_params
    params.require(:six_pack_order).permit(:order_id,:customer_id,:created_at,:item_purchased,
    :email, :first_name, :last_name, :item_description, :price, :quantity, :order_unique_key)
  end
end
