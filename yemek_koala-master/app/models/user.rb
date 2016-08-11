class User < ActiveRecord::Base
  self.primary_key = "id"
  has_many :subscriptions
  has_many :events, :through => :subscriptions
end