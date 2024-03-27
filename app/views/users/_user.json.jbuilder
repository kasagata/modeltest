json.extract! user, :id, :name, :email, :phone, :address, :sex, :age, :created_at, :updated_at
json.url user_url(user, format: :json)
