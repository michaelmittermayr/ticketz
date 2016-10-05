class ChangeIntegerLimitInYourTable2 < ActiveRecord::Migration
  def change
    change_column :tickets, :id, :integer, limit: 8
  end
end
