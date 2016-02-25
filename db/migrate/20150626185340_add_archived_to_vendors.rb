class AddArchivedToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :archived, :boolean
    change_column_default :vendors, :archived, false
  end
end
