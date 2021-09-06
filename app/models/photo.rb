class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :comments,
             dependent: :destroy

  has_many   :likes,
             dependent: :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  scope :test, -> {}

  def to_s
    caption
  end
end
