class CreateLocalities < ActiveRecord::Migration[5.2]
  def change
    create_table :localities do |t|
      t.string :name,             null: false
      t.string :description,      null: false
      t.string :zip_code,         null: false
      t.string :representative,   null: false, default: "Unknown"
      t.string :contact_email,    null: false, default: "Unknown"

      t.timestamps
    end
  end
end
