class RemoveTakedUserFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :taked_user, :integer
  end
end
