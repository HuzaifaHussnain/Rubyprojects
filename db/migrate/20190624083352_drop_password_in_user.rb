class DropPasswordInUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password, :salt
  end
end
