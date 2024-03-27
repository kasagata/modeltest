class AddNotnull < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, null:false
    change_column :users, :email, :string, null:false
    change_column :users, :phone, :string, null:false
    change_column :users, :address, :string, null:false

    change_column :orders, :order_date, :datetime, null:false
    change_column :orders, :channel, :integer, null:false

    change_column :services, :name, :string, null:false
    change_column :services, :price, :integer, null:false    
    
    change_column :categories, :name, :string, null:false    
    
  end
end
