json.extract! product, :id, :quantity, :title, :description, :cost_per_unit, :pickup_location, :expiry, :food_category, :image, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
