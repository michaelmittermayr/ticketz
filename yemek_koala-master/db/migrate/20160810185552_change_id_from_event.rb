class ChangeIdFromEvent < ActiveRecord::Migration
  def change
    change_column :events, :id, :bigint, limit: 8
  end
end
