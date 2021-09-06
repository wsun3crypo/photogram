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

  has_many :follower, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.follower.map(&:id))
      end
    end
  end

  has_many :following, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.following.map(&:id))
      end
    end
  end

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

  filter :sender_id, :integer do
    eq do |scope, value|
      scope.eager_load(:follower).where(follow_requests: { sender_id: value })
    end
  end

  filter :recipient_id, :integer do
    eq do |scope, value|
      scope.eager_load(:following).where(follow_requests: { recipient_id: value })
    end
  end
end
