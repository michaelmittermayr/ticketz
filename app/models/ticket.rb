class Ticket < ActiveRecord::Base
  belongs_to :event

  self.primary_key = 'id'
end