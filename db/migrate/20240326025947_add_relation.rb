class AddRelation < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :user, foreign_key: true
    add_reference :orders, :shipping_address, foreign_key: true
    add_reference :items, :order, foreign_key: true
    add_reference :services, :category, foreign_key: true
  end
end
