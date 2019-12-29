json.extract! promo_code, :id, :name, :promo_type, :discount_value, :minimum_amount, :expiration_date, :created_at, :updated_at
json.url promo_code_url(promo_code, format: :json)
