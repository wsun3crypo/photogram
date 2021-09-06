class FollowRequest < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sender.to_s
  end

end
