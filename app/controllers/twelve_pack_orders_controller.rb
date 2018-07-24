class TwelvePackOrdersController < ApplicationController
  def index
    render json: TwelvePackOrder.order(:last_name, :first_name, :created_at)
  end

  def create
    @twelve_pack_order = TwelvePackOrder.create(twelve_pack_order_params)

    if @twelve_pack_order.save
      render json: @twelve_pack_order, status: :created
    else
      render json: @twelve_pack_order.errors, status: :unprocessable_entity
    end
  end

  def twelve_pack_order_params
    params.require(:twelve_pack_order).permit(:order_id,:customer_id,:created_at,:item_purchased,
    :email, :first_name, :last_name, :item_description, :price, :quantity, :order_unique_key)
  end
end
