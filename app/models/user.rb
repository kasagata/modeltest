class User < ApplicationRecord
    has_many :orders
    enum sex: {man: 0, woman: 1}
    enum age: {ten: 0, twenty: 1, threty: 2, fourty: 3}
end
