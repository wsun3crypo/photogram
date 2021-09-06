class Comment < ApplicationRecord
  # Direct associations

  belongs_to :photo

  belongs_to :user

  # Indirect associations

  has_one    :commentator,
             through: :photo,
             source: :user

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
