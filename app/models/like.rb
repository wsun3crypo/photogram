class Like < ApplicationRecord
  # Direct associations

  belongs_to :photo

  belongs_to :user

  # Indirect associations

  has_one    :liker,
             :through => :photo,
             :source => :user

  # Validations

  # Scopes

  def to_s
    photo.to_s
  end

end
