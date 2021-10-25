class AddTakedUserAndTakedDateToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :taked_user, :string
    add_column :items, :taked_date, :date
  end
end
