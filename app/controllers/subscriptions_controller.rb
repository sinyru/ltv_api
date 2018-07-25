class SubscriptionsController < ApplicationController
  def index
    subscription_counts = RestClient::Request.execute(
      method: :get,
      url: "https://api.rechargeapps.com/subscriptions/count",
      :headers => {'X-Recharge-Access-Token' => "3f1bda3d20fa167799472057492c3ff8d04dcbd0a35627e1136d98d9"}
    )
    num_pages = JSON.parse(subscription_counts)
    @subscriptions = []
    for i in 1..(num_pages["count"]/250+1)
      subscriptions = RestClient::Request.execute(
        method: :get,
        url: "https://api.rechargeapps.com/subscriptions?limit=250&page=#{i}",
        :headers => {'X-Recharge-Access-Token' => "3f1bda3d20fa167799472057492c3ff8d04dcbd0a35627e1136d98d9"}
      )
      subscriptions = JSON.parse(subscriptions)
      @subscriptions << subscriptions
    end
    render json: @subscriptions
  end
end
