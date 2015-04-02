class AddImageToPbugs < ActiveRecord::Migration
  def change
    add_column :pbugs, :image, :string
  end
end
