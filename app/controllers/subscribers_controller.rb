class SubscribersController < ApplicationController
  def index
    subscriber_counts = RestClient::Request.execute(
      method: :get,
      url: "https://api.rechargeapps.com/customers/count",
      :headers => {'X-Recharge-Access-Token' => "3f1bda3d20fa167799472057492c3ff8d04dcbd0a35627e1136d98d9"}
    )
    num_pages = JSON.parse(subscriber_counts)
    @customers = []
    for i in 1..(num_pages["count"]/250+1)
      customers = RestClient::Request.execute(
        method: :get,
        url: "https://api.rechargeapps.com/customers?limit=250&page=#{i}",
        :headers => {'X-Recharge-Access-Token' => "3f1bda3d20fa167799472057492c3ff8d04dcbd0a35627e1136d98d9"}
      )
      customers = JSON.parse(customers)
      @customers << customers
    end
    render json: @customers
  end
end
