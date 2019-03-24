class CreateLocalities < ActiveRecord::Migration[5.2]
  def change
    create_table :localities do |t|

      t.timestamps
    end
  end
end
