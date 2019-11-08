class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :author_id
      t.integer :category_id

      t.timestamps
    end
    add_index :tests, ["title", "level"], :unique => true
  end
end
