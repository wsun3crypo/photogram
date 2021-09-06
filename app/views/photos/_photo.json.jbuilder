json.extract! photo, :id, :caption, :image, :user_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
