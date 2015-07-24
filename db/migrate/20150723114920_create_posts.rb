class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.date :publication_date
      t.text :body

      t.timestamps null: false
    end
  end
end
