class Order < ApplicationRecord
    has_many :items
    belongs_to :user
    belongs_to :shipping_address

end
