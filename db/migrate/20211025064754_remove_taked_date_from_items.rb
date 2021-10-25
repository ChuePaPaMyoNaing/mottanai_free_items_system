class RemoveTakedDateFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :taked_date, :date
  end
end
