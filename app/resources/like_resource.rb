class LikeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :photo_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :photo

  belongs_to :user

  # Indirect associations

  has_one    :liker,
             resource: UserResource
end
