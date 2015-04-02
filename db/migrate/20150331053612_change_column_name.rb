class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :pbugs, :type, :bugtype
  end
end
