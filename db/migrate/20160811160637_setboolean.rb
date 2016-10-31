class Setboolean < ActiveRecord::Migration
  def change
    change_column :subscriptions, :status, :boolean
  end
end
