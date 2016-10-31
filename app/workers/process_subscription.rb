require "koala"
require "user"
require "event"
require "subscription"

class ProcessSubscription
  include SuckerPunch::Job

  def perform(event, email)
    User.transaction do
      user = User.find_or_create_by(email: email)
      event = Event.find_or_create_by(id: event)
      Subscription.find_or_create_by(event_id: event.id, user_id: user.id)
    end
  end
end