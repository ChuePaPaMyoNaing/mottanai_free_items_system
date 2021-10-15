class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.string :description
      t.date :post_date
      t.timestamps
    end
  end
end
