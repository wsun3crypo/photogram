json.extract! comment, :id, :user_id, :photo_id, :contents, :created_at, :updated_at
json.url comment_url(comment, format: :json)
