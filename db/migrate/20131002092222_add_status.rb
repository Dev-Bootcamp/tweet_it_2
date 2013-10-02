class AddStatus < ActiveRecord::Migration
  def change
    add_column :tweets, :status, :string
    remove_column :tweets, :text
  end
end
