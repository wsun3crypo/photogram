class Post < ApplicationRecord
  # Direct associations

  belongs_to :users,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    body
  end
end
