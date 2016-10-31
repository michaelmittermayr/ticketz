class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  self.primary_key = 'id'
end