class CustomersController < ApplicationController

  def index
      render json: Customer.all
  end

  def create

    @customer = Customer.create(customer_params)
    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end

  end

  def customer_params
    params.require(:customer).permit(:customer_id, :email, :created_at, :updated_at, :first_name, :last_name, :province, :country)
  end
end
