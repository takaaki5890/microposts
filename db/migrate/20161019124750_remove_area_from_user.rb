class RemoveAreaFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :area, :integer
  end
end
