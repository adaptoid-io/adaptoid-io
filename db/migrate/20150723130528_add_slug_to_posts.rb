class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string, null: false
  end
end
