class TwentyFourPackOrdersController < ApplicationController
  def index
    render json: TwentyFourPackOrder.order(:last_name, :first_name, :created_at)
  end

  def create
    @twenty_four_pack_order = TwentyFourPackOrder.create(twenty_four_pack_order_params)

    if @twenty_four_pack_order.save
      render json: @twenty_four_pack_order, status: :created
    else
      render json: @twenty_four_pack_order.errors, status: :unprocessable_entity
    end
  end

  def twenty_four_pack_order_params
    params.require(:twenty_four_pack_order).permit(:order_id,:customer_id,:created_at,:item_purchased,
    :email, :first_name, :last_name, :item_description, :price, :quantity, :order_unique_key)
  end
end
