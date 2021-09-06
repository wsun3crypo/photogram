class PostResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :body, :string
  attribute :image, :string
  attribute :users_id, :integer

  # Direct associations

  # Indirect associations

end
