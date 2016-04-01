class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :username, null: false

      t.timestamps null: false
    end

    add_index :authors, :email, unique: true
    add_index :authors, :username, unique: true
  end
end
