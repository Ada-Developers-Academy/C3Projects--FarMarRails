class AddArchivedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :archived, :boolean
    change_column_default :products, :archived, false
  end
end
