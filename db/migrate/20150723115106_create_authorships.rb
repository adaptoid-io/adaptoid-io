class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|

      t.timestamps null: false
    end

    add_reference :authorships, :author
    add_reference :authorships, :post
  end
end
