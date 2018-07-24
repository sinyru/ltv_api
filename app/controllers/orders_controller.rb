class OrdersController < ApplicationController

  def index
    api_key = '37f23df615aa2b2146209b891fdf724d'
    secret_key = 'aabba34721a2ed46166b84990dfce8f2'

    date_start = Rdate.last.start_date
    date_end = Date.today

    @orders = []

    num_pages = RestClient::Request.execute(
      method: :get,
      url: "https://#{api_key}:#{secret_key}@myonecondoms-us.myshopify.com/admin/orders/count.json?status=any&created_at_min=#{date_start}&created_at_max=#{date_end}"
    )

    num_pages = JSON.parse(num_pages)

    for i in 1..(num_pages["count"]/250+1)
      shopify_orders = RestClient::Request.execute(
        method: :get,
        url: "https://#{api_key}:#{secret_key}@myonecondoms-us.myshopify.com/admin/orders.json?status=any&created_at_min=#{date_start}&created_at_max=#{date_end}&limit=250&page=#{i}"
      )
      orders = JSON.parse(shopify_orders)
      @orders << orders
    end

    render json: @orders
  end



end
