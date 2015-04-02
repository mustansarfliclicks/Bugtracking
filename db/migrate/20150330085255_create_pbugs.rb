class CreatePbugs < ActiveRecord::Migration
  def change
    create_table :pbugs do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :deadline
      t.string :status
      t.string :type

      t.timestamps null: false
    end
  end
end
