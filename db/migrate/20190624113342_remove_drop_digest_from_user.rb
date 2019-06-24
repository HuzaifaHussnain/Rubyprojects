class RemoveDropDigestFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :drop_digest
  end
end
