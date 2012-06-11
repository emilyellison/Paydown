class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :past
      t.text :future
      t.integer :user_id

      t.timestamps
    end
  end
end
