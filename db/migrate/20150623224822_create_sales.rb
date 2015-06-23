class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :amount null: false
      t.datetime :purchase_time
      t.integer :vendor_id null: false
      t.integer :product_id null: false
      t.timestamps null: false
    end
  end
end
