class ChangeIntegerLimitInYourTable < ActiveRecord::Migration
  def change
    change_column :tickets, :event_id, :integer, limit: 8
    change_column :subscriptions, :event_id, :integer, limit: 8
  end
end
