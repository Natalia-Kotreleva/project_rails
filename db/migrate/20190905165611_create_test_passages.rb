class CreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|
      t.integer :test_id
      t.integer :user_id

      t.timestamps
    end
  end
end
