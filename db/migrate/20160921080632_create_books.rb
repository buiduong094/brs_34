class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.datetime :publish_date
      t.integer :number_of_page
      t.string :image
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
