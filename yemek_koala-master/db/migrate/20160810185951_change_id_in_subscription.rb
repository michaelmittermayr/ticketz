class ChangeIdInSubscription < ActiveRecord::Migration
  def change
    change_column :subscriptions, :event_id, :integer, limit: 8
  end
end
