class AddArchivedToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :archived, :boolean
    change_column_default :markets, :archived, false
  end
end
