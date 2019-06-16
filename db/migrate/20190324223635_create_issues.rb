class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title,          null: false
      t.string :issue_image,    null: false, default: ""
      t.string :body,           null: false
      t.integer :rating,        null: false, default: 0
      t.belongs_to :locality
      t.belongs_to :user

      t.timestamps
    end
  end
end
