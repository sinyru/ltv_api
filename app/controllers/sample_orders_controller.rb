class SampleOrdersController < ApplicationController
  def index
    render json: SampleOrder.order(:last_name, :first_name, :created_at)
  end

  def create
    @sample_order = SampleOrder.create(sample_order_params)

    if @sample_order.save
      render json: @sample_order, status: :created
    else
      render json: @sample_order.errors, status: :unprocessable_entity
    end
  end

  def sample_order_params
    params.require(:sample_order).permit(:order_id,:customer_id,:created_at,:item_purchased,
      :email, :first_name, :last_name, :item_description, :price, :quantity, :order_unique_key)
  end
end
