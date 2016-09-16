class SubscriptionsController < ApplicationController
  def edit
    Subscription.find(params["id"]).update(status: 0)
  end
end