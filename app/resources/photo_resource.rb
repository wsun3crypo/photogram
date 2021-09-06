class PhotoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :caption, :string
  attribute :image, :string
  attribute :user_id, :integer

  # Direct associations

  has_many   :comments

  has_many   :likes

  belongs_to :user

  # Indirect associations

end
