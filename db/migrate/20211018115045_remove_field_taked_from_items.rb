class RemoveFieldTakedFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :taked, :integer
  end
end
