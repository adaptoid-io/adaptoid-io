class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.timestamps null: false
    end

    add_reference :authorships, :author, null: false, index: true, foreign_key: true
    add_reference :authorships, :post, null: false, index: true, foreign_key: true
  end
end
