class SubscriberCountsController < ApplicationController
  def index
    subscriber_counts = RestClient::Request.execute(
      method: :get,
      url: "https://api.rechargeapps.com/customers/count",
      :headers => {'X-Recharge-Access-Token' => "3f1bda3d20fa167799472057492c3ff8d04dcbd0a35627e1136d98d9"}
    )
    num_pages = JSON.parse(subscriber_counts)
    render json: num_pages
  end
end
