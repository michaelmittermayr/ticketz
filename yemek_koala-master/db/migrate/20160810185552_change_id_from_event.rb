class ChangeIdFromEvent < ActiveRecord::Migration
  def change
    change_column :events, :id, :integer, limit: 8
  end
end
