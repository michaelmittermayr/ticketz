class AddLimitto8 < ActiveRecord::Migration
  def change
    change_column :tickets, :event_id, :integer, limit: 8
  end
end
