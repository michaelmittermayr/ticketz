class Event < ActiveRecord::Base
  self.primary_key = "id"
  has_many :subscriptions
  has_many :users, :through => :subscriptions
  has_many :tickets
end