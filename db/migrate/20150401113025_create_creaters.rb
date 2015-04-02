class CreateCreaters < ActiveRecord::Migration
  def change
    create_table :creaters do |t|

      t.timestamps null: false
    end
  end
end
