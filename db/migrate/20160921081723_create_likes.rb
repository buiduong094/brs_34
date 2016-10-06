class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :status
      t.integer :activity_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
