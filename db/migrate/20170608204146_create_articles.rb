class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :title
      t.string  :description
      t.decimal :price
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
