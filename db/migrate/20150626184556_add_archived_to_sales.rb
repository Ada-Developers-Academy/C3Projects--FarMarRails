class AddArchivedToSales < ActiveRecord::Migration
  def change
    add_column :sales, :archived, :boolean
    change_column_default :sales, :archived, false
  end
end
