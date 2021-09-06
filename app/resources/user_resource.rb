class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :posts,
             foreign_key: :users_id

  has_many   :comments

  has_many   :request_received,
             resource: FollowRequestResource,
             foreign_key: :recipient_id

  has_many   :requests_sent,
             resource: FollowRequestResource,
             foreign_key: :sender_id

  has_many   :likes

  has_many   :photos

  # Indirect associations

  has_many :likess, resource: LikeResource do
    assign_each do |user, likes|
      likes.select do |l|
        l.id.in?(user.likess.map(&:id))
      end
    end
  end

  has_many :commentss, resource: CommentResource do
    assign_each do |user, comments|
      comments.select do |c|
        c.id.in?(user.commentss.map(&:id))
      end
    end
  end

end
