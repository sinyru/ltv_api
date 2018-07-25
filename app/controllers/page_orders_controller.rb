class PageOrdersController < ApplicationController
  def index
    api_key = '37f23df615aa2b2146209b891fdf724d'
    secret_key = 'aabba34721a2ed46166b84990dfce8f2'

    date_start = Rdate.last.start_date
    date = Rdate.last.start_date.split("-")
    date_end = (Date.new(date[0].to_i, date[1].to_i, date[2].to_i)+7).to_s.split("-")
    date_end = date_end[0]+"-"+date_end[1]+"-"+date_end[2].split(" ")[0]

    @orders = []

    num_pages = RestClient::Request.execute(
      method: :get,
      url: "https://#{api_key}:#{secret_key}@myonecondoms-us.myshopify.com/admin/orders/count.json?status=any&created_at_min=#{date_start}&created_at_max=#{date_end}"
    )

    num_pages = JSON.parse(num_pages)

    for i in 1..(num_pages["count"]/50+1)
      shopify_orders = RestClient::Request.execute(
        method: :get,
        url: "https://#{api_key}:#{secret_key}@myonecondoms-us.myshopify.com/admin/orders.json?status=any&created_at_min=#{date_start}&created_at_max=#{date_end}&limit=50&page=#{i}"
      )
      orders = JSON.parse(shopify_orders)
      @orders << orders
    end

    Rdate.create({"start_date": date_end})

    render json: @orders
  end
end
