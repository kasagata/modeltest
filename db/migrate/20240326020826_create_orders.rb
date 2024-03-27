class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.integer :status
      t.integer :channel
      t.integer :price

      t.timestamps
    end
  end
end
