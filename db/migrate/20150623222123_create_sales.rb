class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :amount
      t.datetime :purchase_time
      t.integer :vendor_id, index: true
      t.integer :product_id, index: true
      t.timestamps null: false
    end
  end
end
