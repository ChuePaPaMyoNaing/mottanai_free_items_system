class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.date :upload_date
      t.integer :taked
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
